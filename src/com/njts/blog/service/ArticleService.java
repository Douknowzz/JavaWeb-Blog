package com.njts.blog.service;

import com.njts.blog.bean.Article;
import com.njts.blog.bean.AxisArticle;
import com.njts.blog.bean.Sort;
import com.njts.blog.dao.ArticleDao;
import com.njts.blog.utils.ArticleUtils;
import org.apache.commons.lang.StringUtils;

import java.sql.SQLException;
import java.util.*;

public class ArticleService {

    ArticleDao articleDao = new ArticleDao();

    /**
     * 获得最近的文章，1是以前的，2是后面的
     * @param time
     * @return
     * @throws SQLException
     */
    public static Article getPreviousArticle(String time) throws SQLException {
        return ArticleDao.getANearArticle(time, 1);
    }

    public static Article getNextArticle(String time) throws SQLException {
        return ArticleDao.getANearArticle(time, 2);
    }

    /**
     * 将从数据库获取到article的sort分类和个数的数据封装成map返回
     * @return
     * @throws SQLException
     */
    public Map getSortAndCount() throws SQLException {
        //从数据库获取到article的sort分类和个数的数据
        List<Sort> columAndCount = articleDao.getColumAndCount();

        //创建map集合，存储数据
        Map<String, Integer> map = new HashMap<>();
        for(Sort sort : columAndCount){
            map.put(sort.getSort(),sort.getCounts());
        }
        return map;
    }

    /**
     * 获得所有的文章并且处理后返回
     * @return
     * @throws SQLException
     */
    public List getAllArticle() throws SQLException {
        List<Article> allArticle = articleDao.getAllArticle();

        //处理一下显示在主页面上的文章，减少内容，去掉时间的时分秒
        ArticleUtils.cutContent(allArticle);
        ArticleUtils.cutTime(allArticle);

        return allArticle;
    }

    /**
     * 返回文章总数
     * @return
     * @throws SQLException
     */
    public int getArticleCount() throws SQLException {
        int articleCount = articleDao.getArticleCount();
        return articleCount;
    }

    /**
     * 返回分类总数
     * @return
     * @throws SQLException
     */
    public int getSortCount() throws SQLException {
        int sortCount = articleDao.getSortCount();
        return sortCount;
    }

    /**
     * 返回处理后的阅读排行文章
     * @return
     * @throws SQLException
     */
    public List<Article> getVisitRank() throws SQLException {
        List<Article> visitRank = articleDao.getVisitRank();

        // 如果文章数大于10就不再显示
        if (visitRank.size() > 10) {
            for (int i = 10; i < visitRank.size(); i++) {
                visitRank.remove(i);
            }
        }
        // 截去文章题目大于10汉字的部分
        for (int y = 0; y < visitRank.size(); y++) {
            Article article = visitRank.get(y);
            if (article.getTitle().length() > 20) {
                article.setTitle(ArticleUtils.cutTitle(article.getTitle(), 0, 19) + "...");
            }
        }

        return visitRank;
    }

    /**
     * 把分类名和该分类下的文章封装到一个map集合中，sort_name是不同的分类名，all就是所有分类名
     * @return
     * @throws SQLException
     */
    public Map<String, List<Article>> getSortAndArticle(String sort_name) throws SQLException {
        Map<String, List<Article>> map = new HashMap<>();
        // 获取所有分类
        if (sort_name.equals("all") || StringUtils.isEmpty(sort_name)) {
            List<String> allSort = articleDao.getAllSort();

            for (int i = 0; i < allSort.size(); i++) {
                String sort = allSort.get(i);
                List<Article> articleByColumn = articleDao.getArticleByColumnOfSort(sort);
                ArticleUtils.cutTime(articleByColumn);
                map.put(sort, articleByColumn);
            }
        } else {
            // 获取单个分类
            List<Article> articleByColumn = articleDao.getArticleByColumnOfSort(sort_name);
            ArticleUtils.cutTime(articleByColumn);
            map.put(sort_name, articleByColumn);
        }
        return map;
    }

    public List<Article> getArticle(String value) throws SQLException {
        return articleDao.getArticleByColumnOfId(value);
    }

    public List<AxisArticle> getAxisList() throws SQLException {
        // 1.获取数据库中，所有文章
        List<Article> allArticle = articleDao.getAllArticle();

        // 2.用来存放时间轴文章
        List<AxisArticle> axisArticleList = new ArrayList<>();

        // 3.把所有Article变成AxisArticle存入
        for (Article article : allArticle) {
            AxisArticle axisArticle = ArticleUtils.changeToAxisArticle(article);
            axisArticleList.add(axisArticle);
        }

        /**
         * 这里开始处理数据 文章排序是 2018-2017-2016 时间降序
         * 因为要实现 文章+文章+year 文章+文章+year的效果 这里把year封装成一个特殊的AxisArticle对象
         * id=0 year = 文章截至日期
         * 然后全部存入 result 中
         * 在jsp判断id==0 true: year输出 false: 输出AxisArticle对象的
         */
        AxisArticle tmpAxisArticle = null;
        List result = new LinkedList();
        // 塞进去最新的一个年份 并且塞入第一个AxisArticle
        if (!axisArticleList.isEmpty()) {
            tmpAxisArticle = new AxisArticle();
            tmpAxisArticle.setId(0);
            tmpAxisArticle.setYear(axisArticleList.get(0).getYear());
            result.add(tmpAxisArticle);
            result.add(axisArticleList.get(0));
        }
        // 判断文章年份是不是不一样 不一样则塞一个year
        for (int i = 1; i < axisArticleList.size(); i++) {
            int present_year = axisArticleList.get(i).getYear();
            int past_year = axisArticleList.get(i - 1).getYear();

            if (present_year != past_year) {
                tmpAxisArticle = new AxisArticle();
                tmpAxisArticle.setId(0);
                tmpAxisArticle.setYear(present_year);
                result.add(tmpAxisArticle);
            }
            result.add(axisArticleList.get(i));
        }
        // 注意: 在list遍历里面动态修改了数组长度会出现内存溢出的情况
        return result;
    }

    public int starArticle(int id) throws SQLException {
        return articleDao.star_article(id);
    }

    public void addVisit(int article_id) throws SQLException {
        articleDao.addVisit(article_id);
    }
}

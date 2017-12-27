package com.easy.kotlin.controller

import com.easy.kotlin.entity.Article
import com.easy.kotlin.jpa.ArticleJPA
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.servlet.ModelAndView
import java.util.*

@Controller
class ArticleController {

    @Autowired
    val articleJPA:ArticleJPA?=null

    @GetMapping("listAllArticle")
    @ResponseBody
    fun listAllArticle():MutableList<Article>?{
        return articleJPA?.findAll()
    }

    @GetMapping("listAllArticleView")
    fun listAllArticleView(model:Model):ModelAndView{
        model.addAttribute("articles",articleJPA?.findAll())
        return ModelAndView("list")
    }

    @PostMapping("saveArticle")
    @ResponseBody
    fun saveArticle(article: Article): Article?{
        article.gmtCreated = Date()
        article.gmtModified = Date()
        article.version = 0
        return articleJPA?.save(article)
    }

    @GetMapping("detailArticleView")
    fun detailArticleView(id: Long, model: Model): ModelAndView {
        model.addAttribute("article", articleJPA?.findOne(id))
        return ModelAndView("detailArticleView")
    }

}

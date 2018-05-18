/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.cc.entity.InfoTbSubject;
import com.thinkgem.jeesite.modules.cc.service.InfoTbSubjectService;

/**
 * 市场主体Controller
 * @author hjh
 * @version 2018-05-27
 */
@Controller
@RequestMapping(value = "${adminPath}/cc/infoTbSubject")
public class InfoTbSubjectController extends BaseController {

	@Autowired
	private InfoTbSubjectService infoTbSubjectService;
	
	@ModelAttribute
	public InfoTbSubject get(@RequestParam(required=false) String id) {
		InfoTbSubject entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = infoTbSubjectService.get(id);
		}
		if (entity == null){
			entity = new InfoTbSubject();
		}
		return entity;
	}
	
	@RequiresPermissions("cc:infoTbSubject:view")
	@RequestMapping(value = {"list", ""})
	public String list(InfoTbSubject infoTbSubject, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<InfoTbSubject> page = infoTbSubjectService.findPage(new Page<InfoTbSubject>(request, response), infoTbSubject); 
		model.addAttribute("page", page);
		return "modules/cc/infoTbSubjectList";
	}

	@RequiresPermissions("cc:infoTbSubject:view")
	@RequestMapping(value = "form")
	public String form(InfoTbSubject infoTbSubject, Model model) {
		model.addAttribute("infoTbSubject", infoTbSubject);
		return "modules/cc/infoTbSubjectForm";
	}
	
	@RequiresPermissions("cc:infoTbSubject:view")
	@RequestMapping(value = "view")
	public String view(InfoTbSubject infoTbSubject, Model model) {
		model.addAttribute("infoTbSubject", infoTbSubject);
		return "modules/cc/infoTbSubjectView";
	}

	@RequiresPermissions("cc:infoTbSubject:edit")
	@RequestMapping(value = "save")
	public String save(InfoTbSubject infoTbSubject, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, infoTbSubject)){
			return form(infoTbSubject, model);
		}
		infoTbSubjectService.save(infoTbSubject);
		addMessage(redirectAttributes, "保存市场主体成功");
		return "redirect:"+Global.getAdminPath()+"/cc/infoTbSubject/?repage";
	}
	
	@RequiresPermissions("cc:infoTbSubject:edit")
	@RequestMapping(value = "delete")
	public String delete(InfoTbSubject infoTbSubject, RedirectAttributes redirectAttributes) {
		infoTbSubjectService.delete(infoTbSubject);
		addMessage(redirectAttributes, "删除市场主体成功");
		return "redirect:"+Global.getAdminPath()+"/cc/infoTbSubject/?repage";
	}

}
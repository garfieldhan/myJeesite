/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.cc.entity.InfoTbSubject;
import com.thinkgem.jeesite.modules.cc.dao.InfoTbSubjectDao;

/**
 * 市场主体Service
 * @author hjh
 * @version 2018-05-27
 */
@Service
@Transactional(readOnly = true)
public class InfoTbSubjectService extends CrudService<InfoTbSubjectDao, InfoTbSubject> {

	public InfoTbSubject get(String id) {
		return super.get(id);
	}
	
	public List<InfoTbSubject> findList(InfoTbSubject infoTbSubject) {
		return super.findList(infoTbSubject);
	}
	
	public Page<InfoTbSubject> findPage(Page<InfoTbSubject> page, InfoTbSubject infoTbSubject) {
		return super.findPage(page, infoTbSubject);
	}
	
	@Transactional(readOnly = false)
	public void save(InfoTbSubject infoTbSubject) {
		super.save(infoTbSubject);
	}
	
	@Transactional(readOnly = false)
	public void delete(InfoTbSubject infoTbSubject) {
		super.delete(infoTbSubject);
	}
	
}
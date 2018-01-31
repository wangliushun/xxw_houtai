package com.jk.service.impl;

import com.jk.dao.FabusMapper;
import com.jk.pojo.Fabus;
import com.jk.service.FabuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FabuServiceImpl implements FabuService {
    @Autowired
    private FabusMapper fabusMapper;

    @Override
    public int addRenWu(Fabus fb) {
        return fabusMapper.addRenWu(fb);
    }
}

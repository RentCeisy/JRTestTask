package net.rentceisy.service;

import net.rentceisy.dao.PartDao;
import net.rentceisy.model.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

//Создаем Service

@Service
public class PartServiceImpl implements PartService {

    @Autowired
    private PartDao partDao;

    public void setPartDao(PartDao partDao) {
        this.partDao = partDao;
    }

    @Override
    @Transactional
    public void createPart(Part part) {
        this.partDao.createPart(part);
    }

    @Override
    @Transactional
    public void updatePart(Part part) {
        this.partDao.updatePart(part);
    }

    @Override
    @Transactional
    public void removePart(int id) {
        this.partDao.removePart(id);
    }

    @Override
    @Transactional
    public Part getPartById(int id) {
        return this.partDao.getPartById(id);
    }

    @Override
    @Transactional
    public List<Part> getListPart() {
        return this.partDao.getListPart();
    }

    @Override
    @Transactional
    public List<Part> getListPartOrderByName() {
        return this.partDao.getListPartOrderByName();
    }

    @Override
    @Transactional
    public List<Part> getListPartOrderByAmount() {
        return this.partDao.getListPartOrderByAmount();
    }

    @Override
    @Transactional
    public List<Part> getListPartOrderByNeeded() {
        return this.partDao.getListPartOrderByNeeded();
    }

    @Override
    @Transactional
    public List<Part> findDetailByName(String nameDetail) {
        return this.partDao.findDetailByName(nameDetail);
    }

    @Override
    @Transactional
    public List<Part> getPartByNeeded() {
        return this.partDao.getPartByNeeded();
    }
}

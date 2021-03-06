package net.rentceisy.dao;

import net.rentceisy.model.Part;

import java.util.List;

public interface PartDao {
    void createPart(Part part);
    void updatePart(Part part);
    void removePart(int id);
    Part getPartById(int id);
    List<Part> getListPart();
    List<Part> getListPartOrderByName();
    List<Part> getListPartOrderByAmount();
    List<Part> getListPartOrderByNeeded();
    List<Part> findDetailByName(String nameDetail);
    List<Part> getPartByNeeded();
}

package net.rentceisy.controller;

import net.rentceisy.model.Part;
import net.rentceisy.service.PartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class PartController {
    private final String CONST_CONT = "cont";
    private final String CONST_NEEDED = "needed";
    private final String CONST_NAME = "name";

    @Autowired
    private PartService partService;

    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @RequestMapping(value = "/part_list", method = RequestMethod.GET)
    public String indexPage(@RequestParam(defaultValue = "1") int pageNumber, @RequestParam(required = false)String sort,@RequestParam(required = false) String searchName, Model model) {
      if(searchName==null) {
        List<Part> partList = null;
        if (sort != null) {
          if (sort.equals(CONST_NAME)) {
            partList = this.partService.getListPartOrderByName();
          } else if (sort.equals(CONST_NEEDED)) {
            partList = this.partService.getListPartOrderByNeeded();
          } else if (sort.equals(CONST_CONT)) {
            partList = this.partService.getListPartOrderByAmount();
          }
        } else {
          partList = this.partService.getListPart();
        }
        int pageCount = (int)Math.ceil(partList.size()/10.0);
        List<Part> pageListParts = new ArrayList<>();
        for (int i = 0; i < partList.size(); i++) {
          if ((i > ((pageNumber*10) - 11)) && (i < (pageNumber*10))) pageListParts.add(partList.get(i));
        }
        if(sort!=null) model.addAttribute("sort", sort);
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("partList", pageListParts);
      } else {
        List<Part> searchPart = this.partService.findDetailByName(searchName.trim());
        model.addAttribute("searchPart", searchPart);
      }
      List<Part> listNeeded = this.partService.getPartByNeeded();
      int min = listNeeded.get(0).getAmount();
      for (Part p : listNeeded) {
        if(p.getAmount()<min) min = p.getAmount();
      }
      model.addAttribute("minCount", min);
      model.addAttribute("title", "Parts list");

      return "part_list";
    }

    @RequestMapping(value = "/remove/{id}")
    public String removePart(@PathVariable("id") int id) {
      this.partService.removePart(id);

      return "redirect:/part_list";
    }

    @RequestMapping(value = "/create")
    public String getCreateView(Model model) {
      model.addAttribute("title", "Добавить деталь для компьютера");

      return "create_part";
    }

    @RequestMapping(value = "/addPart", method = RequestMethod.POST)
    public String addPart(String needed, String name, String count) {
      Part part = new Part();
      part.setName(name);
      part.setAmount(Integer.parseInt(count));
      boolean need;
      need = needed!=null ? true : false;
      part.setNeeded(need);
      this.partService.createPart(part);

      return "redirect:/part_list";
    }

    @RequestMapping(value = "/edit/{id}")
    public String getEditView(@PathVariable("id") int id, Model model){
      Part part = this.partService.getPartById(id);
      model.addAttribute("part", part);
      model.addAttribute("title", "Редактирование детали");

      return "create_part";
    }

    @RequestMapping(value = "/editPart", method = RequestMethod.POST)
    public String editPart(String needed, String name, String count, int id) {
      Part part = this.partService.getPartById(id);
      part.setAmount(Integer.parseInt(count));
      boolean need;
      need = needed!=null ? true : false;
      part.setNeeded(need);
      part.setName(name);
      this.partService.updatePart(part);

      return "redirect:/part_list";
    }
}

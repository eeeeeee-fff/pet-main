package com.ee.pet.controller.Head;

import com.ee.pet.common.R;
import com.ee.pet.controller.UploadController;
import com.ee.pet.entity.Donations;
import com.ee.pet.service.DonationsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/head")
public class Donationscontroller {
    @Autowired
    DonationsService donationsService;
    @Autowired
    UploadController uploadController;
    @PostMapping("/img")
    public R img(@RequestParam("file") List<MultipartFile> image){
     return uploadController.uploadImage(image);
    }
    @PostMapping("/donate")
    public R<String> donations(@RequestBody Donations donation){
     return donationsService.donations(donation);
    }
    //一键插入
//    @PostMapping("/donate2")
//    public R<String> donations2(@RequestBody List<Donations> donation){
//        return donationsService.donations2(donation);
//    }

}

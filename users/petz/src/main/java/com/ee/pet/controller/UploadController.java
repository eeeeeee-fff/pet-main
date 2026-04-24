package com.ee.pet.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.StrUtil;
import com.ee.pet.common.R;
import com.ee.pet.component.WebSocketServer;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Slf4j
@RestController
@RequestMapping("upload")
public class UploadController {
    private static final String IMG_BASE_PATH = Paths.get(System.getProperty("user.dir"))
            .resolve("../pet_house-main/public/pet_imgs")
            .normalize()
            .toAbsolutePath()
            .toString();

    @PostMapping("blog")
    public R<String> uploadImage(@RequestParam("file") List<MultipartFile> image) {
        try {
            List<String> Url = new ArrayList<>();
            for (MultipartFile file : image) {
                String originalFilename = file.getOriginalFilename();
                String fileName = createNewFileName(originalFilename);
                file.transferTo(Paths.get(IMG_BASE_PATH, fileName).toFile());
                Url.add("/pet_imgs/" + fileName);
                log.debug("文件上传成功，{}", fileName);
            }
            return R.success(Url.toString());
        } catch (IOException e) {
            throw new RuntimeException("文件上传失败", e);
        }
    }

    @GetMapping("/blog/delete")
    public R deleteBlogImg(@RequestParam("name") String filename) {
        File file = Paths.get(IMG_BASE_PATH, filename).toFile();
        if (file.isDirectory()) {
            return R.error("文件不存在");
        }
        FileUtil.del(file);
        return R.success("删除成功");
    }

    private String createNewFileName(String originalFilename) {
        String suffix = StrUtil.subAfter(originalFilename, ".", true);
        String name = UUID.randomUUID().toString();
        File dir = new File(IMG_BASE_PATH);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        return StrUtil.format("{}.{}", name, suffix);
    }
}

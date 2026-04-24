package com.ee.pet.service;

import com.ee.pet.common.R;
import com.ee.pet.entity.Dto.Petdto;
import com.ee.pet.entity.Pets;

import java.util.List;

public interface PetsService {
    R<List<Pets>> selectAll( Petdto petdto);

    R<List<Pets>> selectpetbyuser();

    R<Pets> selectById2(int id);

    R<String> insert(List<Pets> pets);
}

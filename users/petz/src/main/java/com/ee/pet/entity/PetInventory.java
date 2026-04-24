package com.ee.pet.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
@Data
@TableName("pet_inventory")
public class PetInventory implements Serializable {
    private static final long serialVersionUID = 1L;

    private int inventoryId;
    private int petId;
    private int currentQuantity;

    private int maxQuantity;
}
package com.ee.pet.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ee.pet.common.BaseContext;
import com.ee.pet.entity.Pets;
import com.ee.pet.entity.Users;
import com.ee.pet.mapper.PetsMapper;
import com.ee.pet.mapper.UsersMapper;
import com.ee.pet.service.MatchingService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;

@Service
public class MatchingServiceimpl extends ServiceImpl<PetsMapper, Pets> implements MatchingService {
    @Autowired
    private PetsMapper petsMapper;
    @Autowired
    private UsersMapper userMapper;

    // 从local中获取当前登录用户的ID
    public int getCurrentUserId(HttpServletRequest request) {
        int currentId = BaseContext.getCurrentId();

        if (currentId != 0) {
            return currentId;
        } else {
            return -1;
        }
    }


    //遍历Pets表中所有的数据，存入一个列表中
    @Override
    public List<Pets> getAllPets() {
        List<Pets> petsList = petsMapper.selectpet();
        return petsList;
    }
    //匹配逻辑
    @Override
    public List<Pets> matching(int userId, @RequestBody List<Pets> petsList) {
        Users users = userMapper.selectById(userId);
//        如果用户的cat_or_dog字段为猫时，匹配出所有Pets表中cat_or_dog中字段为狗的对象并且将其删除出列表。否则用户的cat_or_dog字段为狗时，匹配出所有Pets表中cat_or_dog中字段为猫的对象并且将其删除出列表
        if (users.getCatOrDog().equals("猫")) {
            petsList = petsMapper.selectList(null);
            Iterator<Pets> iterator = petsList.iterator();
            while (iterator.hasNext()) {
                Pets pets = iterator.next();
                if (pets.getCatOrDog().equals("狗")) {
                    iterator.remove();
                }
            }

        } else if (users.getCatOrDog().equals("狗")) {
            petsList = petsMapper.selectList(null);
            Iterator<Pets> iterator = petsList.iterator();
            while (iterator.hasNext()) {
                Pets pets = iterator.next();
                if (pets.getCatOrDog().equals("猫")) {
                    iterator.remove();
                }
            }

        }
        //将Pets列表里所有宠物的score字段全部赋值为0
        for (Pets pets : petsList) {
            pets.setScore(0);
            petsMapper.updateById(pets);
        }

        //若用户的性格为活泼时，匹配出所有 personality 为 活泼的宠物，并且为对应的宠物的Score加20
        if (users.getPersonality().equals("活泼")) {
            for (Pets pets : petsList) {
                if (pets.getPersonality().equals("活泼")) {
                    pets.setScore(pets.getScore() + 20);
                    petsMapper.updateById(pets);
                }
            }
        }
        //如果用户的性格为懒惰时，匹配出所有 personality 为 懒惰的宠物，并且为对应的宠物的Score加20
        if (users.getPersonality().equals("外向")) {
            for (Pets pets : petsList) {
                if (pets.getPersonality().equals("懒惰")) {
                    pets.setScore(pets.getScore() + 20);
                    petsMapper.updateById(pets);
                }
            }
        }
        //如果用户的性格沉稳时，匹配出所有 personality 为 沉稳的宠物，并且为对应的宠物的Score加20
        if (users.getPersonality().equals("沉稳")) {
            for (Pets pets : petsList) {
                if (pets.getPersonality().equals("沉稳")) {
                    pets.setScore(pets.getScore() + 20);
                    petsMapper.updateById(pets);
                }
            }
        }
        //如果用户的性格为内向时，匹配出所有 personality 为 内向的宠物，并且为对应的宠物的Score加20
        if (users.getPersonality().equals("内向")) {
            for (Pets pets : petsList) {
                if (pets.getPersonality().equals("内向")) {
                    pets.setScore(pets.getScore() + 20);
                    petsMapper.updateById(pets);
                }
            }
        }
        //如果用户的bodytypewithpet字段为小，匹配出所有Pets表中 bodytype 中字段为小的宠物，并且为对应的宠物的Score加15分
        if (users.getBodytypewithpet().equals("小")) {
            for (Pets pets : petsList) {
                if (pets.getBodytype().equals("小")) {
                    pets.setScore(pets.getScore() + 10);
                    petsMapper.updateById(pets);
                }
            }
        }
        //如果用户的bodytypewithpet字段为中，匹配出所有Pets表中 bodytype 中字段为中 的宠物，并且为对应的宠物的Score加15分
        if (users.getBodytypewithpet().equals("中")) {
            for (Pets pets : petsList) {
                if (pets.getBodytype().equals("中")) {
                    pets.setScore(pets.getScore() + 10);
                    petsMapper.updateById(pets);
                }
            }
        }
        //如果用户的bodytypewithpet字段为大，匹配出所有Pets表中 bodytype 中字段为大的宠物，并且为对应的宠物的Score加15分
        if (users.getBodytypewithpet().equals("大")) {
            for (Pets pets : petsList) {
                if (pets.getBodytype().equals("大")) {
                    pets.setScore(pets.getScore() + 10);
                    petsMapper.updateById(pets);
                }
            }
        }
        //如果用户的bodytypewithpet字段为超大，匹配出所有Pets表中 bodytype 中字段为超大的宠物，并且为对应的宠物的Score加15分
        if (users.getBodytypewithpet().equals("超大")) {
            for (Pets pets : petsList) {
                if (pets.getBodytype().equals("超大")) {
                    pets.setScore(pets.getScore() + 10);
                    petsMapper.updateById(pets);
                }
            }
        }
        //如果用户的petgender字段为1，那么匹配出所有Pets表中 gender 中字段为1的宠物，并且为对应的宠物的Score加5分。
        if (users.getPetgender() == 1) {
            for (Pets pets : petsList) {
                if (pets.getGender() == 1) {
                    pets.setScore(pets.getScore() + 5);
                    petsMapper.updateById(pets);
                }
            }
        }
        //如果用户的petgender字段为2，那么匹配出所有Pets表中 gender 中字段为2的宠物，并且为对应的宠物的Score加5分。
        if (users.getPetgender() == 2) {
            for (Pets pets : petsList) {
                if (pets.getGender() == 2) {
                    pets.setScore(pets.getScore() + 5);
                    petsMapper.updateById(pets);
                }
            }
        }

        //如果用户的wage字段为1，那么匹配出所有Pets表中month_money字段为1的宠物，并且为对应的宠物的Score加15分，并且匹配出所有Pets表中month_money字段为2的宠物，为对应宠物的Score加10分，并且匹配出所有Pets表中month_money字段为3的宠物，为对应宠物的Score加5分
        if (users.getWage() == 1) {
            for (Pets pets : petsList) {
                if (pets.getMonthMoney() == 1) {
                    pets.setScore(pets.getScore() + 15);
                    petsMapper.updateById(pets);
                }
                if (pets.getMonthMoney() == 2) {
                    pets.setScore(pets.getScore() + 10);
                    petsMapper.updateById(pets);
                }
                if (pets.getMonthMoney() == 3) {
                    pets.setScore(pets.getScore() + 5);
                    petsMapper.updateById(pets);
                }
            }
        }

        //如果用户的wage字段为2，那么匹配出所有Pets表中month_money字段小于等于2的宠物，并且为对应的宠物的Score加15分。且匹配出所有Pets表中month_money字段为3的宠物，为对应宠物的Score加8分，且匹配出所有Pets表中month_money字段为4的宠物，为对应宠物的Score加3分
        if (users.getWage() == 2) {
            for (Pets pets : petsList) {
                if (pets.getMonthMoney() <= 2) {
                    pets.setScore(pets.getScore() + 15);
                    petsMapper.updateById(pets);
                }
                if (pets.getMonthMoney() == 3) {
                    pets.setScore(pets.getScore() + 8);
                    petsMapper.updateById(pets);
                }
                if (pets.getMonthMoney() == 4) {
                    pets.setScore(pets.getScore() + 3);
                    petsMapper.updateById(pets);
                }
            }
        }

        //如果用户的wage字段为3，那么匹配出所有Pets表中month_money字段小于等于3的宠物,并且为对应的宠物的Score加15分,且匹配出所有Pets表中month_money字段为4的宠物，为对应宠物的Score加6分
        if (users.getWage() == 3) {
            for (Pets pets : petsList) {
                if (pets.getMonthMoney() <= 3) {
                    pets.setScore(pets.getScore() + 15);
                    petsMapper.updateById(pets);
                }
                if (pets.getMonthMoney() == 4) {
                    pets.setScore(pets.getScore() + 6);
                    petsMapper.updateById(pets);
                }
            }
        }
        //如果用户的wage字段为4，那么匹配出所有Pets表中month_money字段小于等于4的宠物,并且为对应的宠物的Score加15分
        if (users.getWage() == 4) {
            for (Pets pets : petsList) {
                if (pets.getMonthMoney() <= 4) {
                    pets.setScore(pets.getScore() + 15);
                    petsMapper.updateById(pets);
                }
            }
        }

        //如果用户cleanwithpet字段为较少，那么匹配出Pets表中cleanwithpet字段为不易脏的宠物，并且为对应的宠物的Score加10分，匹配出Pets表中cleanwithpet字段为一般的宠物，为对应宠物加5分
        if (users.getCleanwithpet().equals("较少")) {
            for (Pets pets : petsList) {
                if (pets.getCleanwithpet().equals("不易脏")) {
                    pets.setScore(pets.getScore() + 10);
                    petsMapper.updateById(pets);
                }
                if (pets.getCleanwithpet().equals("一般")) {
                    pets.setScore(pets.getScore() + 5);
                    petsMapper.updateById(pets);
                }
            }
        }
        //如果用户cleanwithpet字段为偶尔，那么匹配出Pets表中cleanwithpet字段为一般或者不易脏的宠物，为对应宠物加10分，匹配出Pets表中cleanwithpet字段为易脏的宠物，为对应宠物加5分
        if (users.getCleanwithpet().equals("偶尔")) {
            for (Pets pets : petsList) {
                if (pets.getCleanwithpet().equals("一般") || pets.getCleanwithpet().equals("不易脏")) {
                    pets.setScore(pets.getScore() + 10);
                    petsMapper.updateById(pets);
                }
                if (pets.getCleanwithpet().equals("易脏")) {
                    pets.setScore(pets.getScore() + 5);
                    petsMapper.updateById(pets);
                }
            }
        }

        //如果用户cleanwithpet字段为经常，那么匹配出Pets表中cleanwithpet字段为易脏或者一般或者不易脏的宠物，为对应宠物加10分
        if (users.getCleanwithpet().equals("经常")) {
            for (Pets pets : petsList) {
                if (pets.getCleanwithpet().equals("易脏") || pets.getCleanwithpet().equals("一般") || pets.getCleanwithpet().equals("不易脏")) {
                    pets.setScore(pets.getScore() + 10);
                    petsMapper.updateById(pets);
                }
            }
        }

        //如果用户environment字段为有，那么匹配出Pets表中environment字段为需要或者不需要的宠物，并且为对应的宠物的Score加10分。否则用户environment字段为无，那么匹配出Pets表中environment字段为不需要的宠物，并且为对应的宠物的Score加10分。
        if (users.getEnvironment().equals("有")) {
            for (Pets pets : petsList) {
                if (pets.getEnvironment().equals("需要") || pets.getEnvironment().equals("不需要")) {
                    pets.setScore(pets.getScore() + 10);
                    petsMapper.updateById(pets);
                }
            }
            if (users.getEnvironment().equals("无")) {
                for (Pets pets : petsList) {
                    if (pets.getEnvironment().equals("不需要")) {
                        pets.setScore(pets.getScore() + 10);
                        petsMapper.updateById(pets);
                    }
                }
            }
        }
        //  如果用户timewithpet字段为1，那么匹配出Pets表中energy字段为1的宠物，并且为对应的宠物的Score加15分。
        if (users.getTimewithpet() == 1) {
            for (Pets pets : petsList) {
                if (pets.getEnergy() == 1) {
                    pets.setScore(pets.getScore() + 15);
                    petsMapper.updateById(pets);
                }
            }
        }
        // 如果用户timewithpet字段为2，那么匹配出Pets表中energy字段为1或者2的宠物，并且为对应的宠物的Score加15分。且匹配出Pets表中energy字段为3的宠物，为对应宠物的Score加7分。
        if (users.getTimewithpet() == 2) {
            for (Pets pets : petsList) {
                if (pets.getEnergy() == 1 || pets.getEnergy() == 2) {
                    pets.setScore(pets.getScore() + 15);
                    petsMapper.updateById(pets);
                }
                if (pets.getEnergy() == 3) {
                    pets.setScore(pets.getScore() + 7);
                    petsMapper.updateById(pets);
                }
            }
        }

        // 如果用户timewithpet字段为3，那么匹配出Pets表中energy字段为1或者2或者3的宠物，并且为对应的宠物的Score加15分。且匹配出Pets表中energy字段为4的宠物，为对应宠物的Score加6分。
        if (users.getTimewithpet() == 3) {
            for (Pets pets : petsList) {
                if (pets.getEnergy() == 1 || pets.getEnergy() == 2 || pets.getEnergy() == 3) {
                    pets.setScore(pets.getScore() + 15);
                    petsMapper.updateById(pets);
                }
                if (pets.getEnergy() == 4) {
                    pets.setScore(pets.getScore() + 6);
                    petsMapper.updateById(pets);
                }
            }
        }
        //如果用户的wage字段为4，那么匹配出所有Pets表中month_money字段小于等于4的宠物,并且为对应的宠物的Score加15分
        if (users.getWage() == 4) {
            for (Pets pets : petsList) {
                if (pets.getMonthMoney() <= 4) {
                    pets.setScore(pets.getScore() + 15);
                }
            }
        }

        //如果用户children字段为1，那么匹配出Pets表中hair字段为1的宠物，并且为对应的宠物的Score加10分。如果用户children字段为2，那么匹配出Pets表中hair字段为1或者2的宠物，并且为对应的宠物的Score加10分。
        if (users.getChildren() == 1) {
            for (Pets pets : petsList) {
                if (pets.getHair() == 1) {
                    pets.setScore(pets.getScore() + 10);
                    petsMapper.updateById(pets);
                }
            }
        }
        if (users.getChildren() == 2) {
            for (Pets pets : petsList) {
                if (pets.getHair() == 1 || pets.getHair() == 2) {
                    pets.setScore(pets.getScore() + 10);
                    petsMapper.updateById(pets);
                }
            }
        }
        return petsList;
    }
    //返回匹配度最高的三只宠物
    public List<Pets> getTopThreePets(List<Pets> petsList) {
        Collections.sort(petsList, (p1, p2) -> p2.getScore() - p1.getScore());
        return petsList.subList(0, Math.min(3, petsList.size()));
    }


}

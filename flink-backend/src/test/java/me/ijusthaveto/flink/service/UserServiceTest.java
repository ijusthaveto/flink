package me.ijusthaveto.flink.service;


import me.ijusthaveto.flink.model.domain.User;
import org.junit.Assert;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * @author: ijusthaveto
 * @create: 2023-11-01
 */
@SpringBootTest
public class UserServiceTest {

    @Resource
    private UserService userService;

    @Test
    public void searchUsersByTagsTest() {
        List<String> tagNameList = Arrays.asList("java", "c++");
        List<User> userList = userService.searchUsersByTags(tagNameList);
        Assert.assertNotNull(userList);
    }
}

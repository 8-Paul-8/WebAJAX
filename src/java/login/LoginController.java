/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nikolaos
 */
public class LoginController {

    public List<User> fetchUsers() {
        List<User> userList = new ArrayList();
        userList.add(new User(1, "nikos"));
        userList.add(new User(2, "maria"));
        userList.add(new User(3, "kostas"));
        userList.add(new User(4, "thalia"));

        return userList;
    }

    public List<User> fetchUsersByGroup(Group group) {
        List<User> userList = new ArrayList();

       List<UserGroup> userGroupList = fetchUserGroups();
        for (UserGroup ug : userGroupList) {
           if (group.getId() == ug.getGroup().getId()) {
                userList.add(ug.getUser());
            }
        }
        return userList;
    }

    public List<Group> fetchGroups() {
        List<Group> groupList = new ArrayList();
        groupList.add(new Group(1, "admin"));
        groupList.add(new Group(2, "user"));

        return groupList;
    }
    
    public Group fetchGroupById(int id) {
        Group group = new Group();
        List<Group> groupList = fetchGroups();
        for(Group gr: groupList){
            if(gr.getId() == id){
                group = gr;
            }
        }
        return group;
    }

    public List<UserGroup> fetchUserGroups() {
        List<UserGroup> userGroupList = new ArrayList();
        userGroupList.add(new UserGroup(new User(3, "kostas"), new Group(1, "admin")));
        userGroupList.add(new UserGroup(new User(1, "nikos"), new Group(2, "user")));
        userGroupList.add(new UserGroup(new User(2, "maria"), new Group(2, "user")));
        userGroupList.add(new UserGroup(new User(4, "thalia"), new Group(2, "user")));

        return userGroupList;
    }

}

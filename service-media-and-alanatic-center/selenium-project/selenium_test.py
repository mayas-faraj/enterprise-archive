#!/usr/bin/env python
from selenium import webdriver
from selenium.webdriver.common.by import By

def program():
    driver=webdriver.Firefox()
    driver.get("https://m.facebook.com")
    title=driver.title
    print(title);
    driver.implicitly_wait(10)
    search_box=driver.find_element(by=By.NAME, value="email")
    search_box.send_keys("mater")

program()

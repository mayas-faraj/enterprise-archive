#!/usr/bin/env python
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC 
from selenium.webdriver.firefox.options import Options

def process():
    options=Options()
    options.headless=True
    #options.page_load_strategy='eager'
    driver=webdriver.Firefox(options=options)
    driver.get("https://twitter.com/search?q=%D8%A7%D9%84%D8%B1%D8%A6%D8%A7%D8%B3%D8%A9%20%D8%A7%D9%84%D8%B3%D9%88%D8%B1%D9%8A%D8%A9&src=typed_query&f=top")
    try:
        element=WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, "accessible-list-0")))
        title=driver.title
        driver.implicitly_wait(40);
        print("==========")
        print(title)
        print("==========")
        content=driver.execute_script("return document.body.innerHTML;")
        #print(content);
        print("----------")
        print("done")
    finally:
        driver.quit()

process()

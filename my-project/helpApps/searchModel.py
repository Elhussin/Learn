from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time

# القيم المطلوب البحث عنها
search_values = [
    "SP5011",
    "SP5011-F",
    "SP5012",
    "SP5012-F",
    "SP5013",
    "SP5018",
    "SP5019-F",
    "SP5022",
    "SP5030-F",
    "SP5039",
    "SP5042",
    "SP5049",
    "SP5051-D"
]

# فتح المتصفح (Chrome)
driver = webdriver.Chrome()  # تأكد أنك منزل ChromeDriver

url = "http://69.167.190.215/Retail/Common/SearchForm.aspx?ucName=ucAddProducts&ID=0&MGType=0&SpecialOffer=0"

for value in search_values:
    driver.get(url)  # كل مرة يفتح نفس الصفحة
    time.sleep(2)    # انتظار تحميل الصفحة
    
    # إيجاد حقل البحث باستخدام ID
    search_box = driver.find_element(By.ID, "UcSearchControls_txtDescLike")
    
    # كتابة القيمة
    search_box.clear()
    search_box.send_keys(value)
    search_box.send_keys(Keys.RETURN)  # ضغط Enter
    
    time.sleep(3)  # انتظار النتائج قبل الانتقال للبحث التالي

# بعد الانتهاء
driver.quit()

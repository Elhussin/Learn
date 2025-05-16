# from os import wait3
from ast import main
import schedule
import time
import webbrowser

urls = [
    "https://summary-lio1.onrender.com/",
    "https://optical-sl8n.onrender.com/",
    "https://wiki-o8b6.onrender.com/",
    "https://mail-bpup.onrender.com/",
    "https://network-ru2r.onrender.com/",
    "https://financeflask.onrender.com/",
    "https://hasin3112.pythonanywhere.com/",
    "https://elhussin.github.io/Online-Radio/",
    "http://company-hub.infy.uk/",
    "http://order.infy.uk/", 
    "http://to-do.infy.uk",
    "https://read-books-react.netlify.app/",
    "https://elhussin.github.io/static-apps/",
    "https://elhussin.github.io/Search.googl.io/",
    "https://elhussin.github.io/io/",

]

def visit():
    for url in urls:
        webbrowser.open(url, new=2, autoraise=True)
        time.sleep(3)

visit()
schedule.every(1).days.at("18:14").do(visit) # visit the list of urls every day at 8am


while True:
    schedule.run_pending()
    time.sleep(1)



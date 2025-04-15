#一.
#1 直接读取网络文件  
url_csv <- "https://raw.githubusercontent.com/dataprofessor/data/master/iris.csv"  
iris_data <- read.csv(url_csv)  

# 检查数据  
head(iris_data)  
summary(iris_data) 

#2 使用 HTTP 库（如 httr）调用 Web API 
install.packages("httr")  
library(httr)  

# 示例：GET 请求获取 JSON 数据  
api_endpoint <- "https://jsonplaceholder.typicode.com/posts/1"  
response <- GET(api_endpoint)  

# 将返回结果转换为文本或解析为 R 对象  
response_content <- content(response, "parsed")  

# 查看相应的数据结构  
print(response_content)  

#3 使用 rvest 包进行网页爬取
# 安装并加载 rvest 包（若尚未安装）  
install.packages("rvest")  
library(rvest)  

# 示例：从维基百科抓取简单表格  
url_page <- "https://en.wikipedia.org/wiki/List_of_countries_by_population_(United_Nations)"  
webpage <- read_html(url_page)  

# 假设需要抓取第一个表格  
table_nodes <- html_nodes(webpage, "table")  
population_table <- html_table(table_nodes[[1]], fill = TRUE)  

# 查看爬取的表格数据  
head(population_table)  


### API 端点指的是什么？
### API 端点（Endpoint）通常是指某个特定的 URL 路径，用于接收请求并向用户返回对应的数据或服务。
### 在生态类数据库中，API 端点就是你可向其发送请求（包括参数）以获取物种信息、分布数据等特定资源的网络地址。


#### 二、
# 安装 RSQLite 包（依赖 DBI），如已安装则可跳过  
install.packages("RSQLite")  

# 加载 DBI 和 RSQLite  
library(DBI)  
library(RSQLite)
library(dplyr)  

#其中 create = TRUE 表示若数据库文件不存在则新建。
mydb <- src_sqlite("dbname.sqlite", create = TRUE)  
# 接着利用 copy_to() 将 CSV 文件上传到 SQLite
env <- read.csv("data/env.csv")  
copy_to(mydb, env) 
mydb <- src_sqlite("dbname.sqlite")  
env <- tbl(mydb, "env")  #先用 src_sqlite(...) 连接现有数据库，然后用 tbl() 指定想要操作的表名。







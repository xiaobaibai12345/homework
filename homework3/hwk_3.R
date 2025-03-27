# 创建三个整数向量  
x <- c(1, 2, 3)  
y <- c(4, 5, 6)  
z <- c(7, 8, 9)  

# 合并为一个3x3的矩阵，每一列代表一个向量  
A <- cbind(x, y, z)  

# 修改行名  
rownames(A) <- c("a", "b", "c")  

# 输出矩阵A  
print(A)  

# 合并为一个3x3的矩阵，每一行代表一个向量  
B <- rbind(x, y, z)  

# 修改列名  
colnames(B) <- c("Col1", "Col2", "Col3")

# 输出矩阵B  
print(B)


# 安装 ade4 包（如果尚未安装）  
# install.packages("ade4")  

# 加载 ade4 包  
library(ade4)  

# 导入 doubs 数据集  
data(doubs)  

# 查看数据集类型  
cat("数据集类型:", class(doubs), "\n")  

# 查看数据集结构  
cat("数据集结构:\n")  
str(doubs)  
# 分别保存各个组成部分  

# 1. 环境变量  
write.csv(doubs$env, file = "doubs_env.csv", row.names = TRUE)  

# 2. 物种数据  
write.csv(doubs$species, file = "doubs_species.csv", row.names = TRUE)  

# 3. 空间坐标  
write.csv(doubs$xy, file = "doubs_xy.csv", row.names = TRUE)  

# 提示信息  
cat("数据已分别保存为 doubs_env.csv, doubs_species.csv, doubs_xy.csv\n")  


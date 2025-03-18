# 设置随机种子并生成 10 个符合 N(35, 10^2) 的随机数  
set.seed(123)  
x <- rnorm(n = 10, mean = 35, sd = 10)  
cat("随机向量 x 为:\n")  
print(x)  

# 定义一个函数，使用 for 循环进行检查  
check_above_threshold_for <- function(vec, threshold = 35) {  
  # 初始化一个和 vec 等长的逻辑向量  
  result <- logical(length(vec))  
  
  # 使用 for 循环检查每个元素是否大于 threshold  
  for (i in seq_along(vec)) { 
    if (vec[i] > threshold) {  
      result[i] <- TRUE  
    } else {  
      result[i] <- FALSE  
    }  
  }  
  
  return(result)  
}  



# 4. 分别调用函数，得到结果  
res_for <- check_above_threshold_for(x, threshold = 35)  


cat("\n使用 for 循环检查的结果:\n")  
print(res_for)  

 
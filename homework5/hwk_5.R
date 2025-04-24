# 安装并加载必要的包  
install.packages(c("ade4", "vegan"))  
library(ade4)  
library(vegan)  

# 加载Doubs数据集  
data(doubs)  

# 计算Shannon多样性指数  
shannon_diversity <- diversity(doubs$fish, index = "shannon")  

# 创建新的数据框  
doubs_diversity <- data.frame(  
  site = rownames(doubs$fish),  
  shannon_index = shannon_diversity,  
  mpg = NA  
)  

# 查看结果  
print(doubs_diversity)  


# 安装并加载必要的包  
install.packages(c("caret", "randomForest"))  
library(caret)  
library(randomForest)  

# 使用mtcars数据集  
data(mtcars)  

# 设置随机数种子  
set.seed(123)  

# 数据拆分  
training_index <- createDataPartition(mtcars$mpg, p = 0.7, list = FALSE)  
training_data <- mtcars[training_index, ]  
testing_data <- mtcars[-training_index, ]  

# 训练随机森林模型  
model_rf <- train(mpg ~ ., data = training_data, method = "rf")  

# 查看模型  
print(model_rf)  



# 1. 设置交叉验证控制参数  
# 使用repeatedcv方法，10折交叉验证，重复5次  
fitControl <- trainControl(  
  method = "repeatedcv",  # 重复交叉验证  
  number = 10,            # 10折  
  repeats = 5             # 重复5次  
)  

# 2. 训练随机森林模型（加入交叉验证）  
model_rf <- train(  
  mpg ~ .,                # 预测mpg，使用所有其他变量  
  data = training_data,   # 训练数据  
  method = "rf",          # 随机森林算法  
  trControl = fitControl  # 添加交叉验证设置  
)  

# 3. 查看模型详细信息  
print(model_rf)  


# 1. 创建参数调优网格  
# 为随机森林的mtry参数设置搜索范围  
grid <- expand.grid(.mtry = c(1:10))  

# 2. 训练随机森林模型（完整版）  
model_rf <- train(  
  mpg ~ .,                      # 预测mpg，使用所有其他变量  
  data = training_data,         # 训练数据  
  method = "rf",                # 随机森林算法  
  preProcess = c('scale', 'center'),  # 数据标准化和中心化  
  trControl = fitControl,       # 交叉验证设置  
  tuneGrid = grid               # 参数调优网格  
)  

# 3. 模型评估  
# 在测试集上进行预测  
predictions <- predict(model_rf, newdata = testing_data)  

# 4. 计算模型性能指标  
model_performance <- postResample(predictions, testing_data$mpg)  
print(model_performance)  

# 5. 打印模型详细信息  
print(model_rf)  


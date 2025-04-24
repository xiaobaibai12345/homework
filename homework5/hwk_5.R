2. 生态学上常用树模型，包括随机森林、提升回归树。建模步骤包括：数据预处理、拆分数据集、选择特征、算法和训练模型、模型评估等。caret为各种机器学习算法提供了统一模板，加载mtcars数据集，请根据问题填空。
1）对于doubs中的鱼群数据，按照样地，计算各样地鱼类Shannon多样性指数，并新增biodiv列。

# 安装并加载必要的包  
install.packages(c("ade4", "vegan"))  
library(ade4) #加载生态统计包，包含了许多生态学用的数据集（比如 doubs） 
library(vegan) #加载生态多样性分析中最常用的包，包含计算Shannon指数 

# 加载Doubs数据集  
data(doubs)  #加载 ade4 包中的 doubs 数据集

# 计算Shannon指数衡量了生物多样性的“信息量”，考虑了物种数量和相对丰度  
shannon_diversity <- diversity(doubs$fish, index = "shannon")  

# 创建新的数据框  
doubs_diversity <- data.frame(  
  site = rownames(doubs$fish), #取每一行的行名作为站点编号  
  shannon_index = shannon_diversity,  #计算的Shannon多样性指数
)  

# 查看结果  
print(doubs_diversity)  

2）利用train()，训练随机森林（randomForest）模型
model_rf <- train(biodiv ~ .,  data = training_data,  method = "    __") 
3）通过trainControl()，向train()添加重采样10-fold cross-validation，以优化参数
           fitControl <- trainControl(method = "          ",  number = 10, repeats = 5)
model_rf <- train(biodiv ~ ., data = training_data, method = "    ", trControl =fitControl) 
4）在train()中，增加中心化和标准化等数据预处理，提高模型精度
model_rf <- train(biodiv ~ ., data = training_data,  method = "    ", 
preProcess = c('scale', 'center'),
trControl =fitControl)
5）rf有mtry和tree两个参数，可以通过expand.grid()设置调优，并在train()添加
grid <- expand.grid(.mtry=c(1:10))
model_rf <- train(biodiv ~ ., data = training_data, method = "    ",
preProcess = c('scale', 'center'),
trControl =fitControl,
_________ =  ________)



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
# 查看模型  
print(model_rf)  

第二步 # 使用 train() 训练随机森林
model_rf <- train(mpg ~ ., data = training_data, method = "rf")  


第三步 # 使用 trainControl() 添加重采样（交叉验证）  
# 使用repeatedcv方法，10折交叉验证，重复5次  
fitControl <- trainControl(  
  method = "repeatedcv",  # 重复交叉验证  
  number = 10,            # 10折  
  repeats = 5             # 重复5次  
)  

第四步 # 加入预处理（标准化和中心化）  
model_rf <- train(
  biodiv ~ ., 
  data = training_data,  
  method = "rf",
  preProcess = c('scale', 'center'),
  trControl = fitControl
)

第五步 # 加入参数调优（mtry）
model_rf <- train(
  biodiv ~ ., 
  data = training_data, 
  method = "rf",
  preProcess = c('scale', 'center'),
  trControl = fitControl,
  tuneGrid = grid
)



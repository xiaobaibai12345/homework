# 加载必要的包  
library(ade4)  # 加载 ade4 包  
library(dplyr)  # 加载 dplyr 包 
library(ggplot2)  # 加载 ggplot2 包  

# 加载数据集  
data("doubs")  # 加载 doubs 数据集  

# 数据处理  
result <- doubs$env |>  # 从 doubs 数据集提取 env 部分  
  select(dfs, alt, oxy) |>  # 选择 dfs、alt 和 oxy 列  
  rename(distance = dfs, oxygen = oxy) |>  # 将 dfs 列重命名为 distance，oxy 列重命名为 oxygen  
  filter(alt > 200) |>  # 筛选 alt 列大于 200 的行  
  arrange(desc(alt)) |>  # 按 alt 列降序排列结果  
  mutate(oxygen_category = ifelse(oxygen > 90, "High", "Low")) |>  # 新增列 oxygen_category，基于氧气值分类为 High 和 Low  
  group_by(oxygen_category) |>  # 按 oxygen_category 分组  
  summarise(  # 计算每个组的平均值  
    mean_alt = mean(alt, na.rm = TRUE),  # 计算平均 alt，处理缺失值  
    mean_pH = mean(doubs$env$ph[doubs$env$alt > 200], na.rm = TRUE),  # 计算平均 pH，条件为 alt 大于 200，处理缺失值  
    .groups = "drop"  # 操作完成后无需保留分组信息  
  )  

# 查看处理的结果  
print(result)  # 打印处理后的结果数据框  

# 绘制散点图  
ggplot(data = doubs$env) +  # 使用原始数据集 doubs 的 env 部分  
  geom_point(mapping = aes(x = alt, y = oxy))  # 准备绘制 x=alt 和 y=oxy 之间的散点图  

# 绘制调整后颜色的散点图  
ggplot(data = doubs$env) +  # 使用原始数据集 doubs 的 env 部分  
  geom_point(mapping = aes(x = alt, y = oxy, colour = dfs))  # 在散点图中使用 dfs 距离调整颜色  
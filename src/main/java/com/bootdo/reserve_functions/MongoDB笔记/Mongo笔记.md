### MongoDB概念

1. 管道和步骤
   ![img.png](img.png)
2. 聚合计算的基本格式
   ![img_1.png](img_1.png)
3. 和MySQL对比 | 步骤 | 作用 | SQL等价运算符 | ------------- | ------ | Smatchr | 过滤 | WHERE | $project | 投影 | AS | $sort | 排序 |
   ORDER BY | $group | 分组 | GROUP BY | $skip/$limit | 结果限制 | SKIP/LIMIT | $lookup | 左外连接 | LEFT OUTER JOIN
4. 常见步骤中的运算符
   ![img_2.png](img_2.png)
   ![img_3.png](img_3.png)
5. 使用场景
   ![img_4.png](img_4.png)
6. MQL 与 SQL 对比
   ![img_5.png](img_5.png)
   分组用_id指定
   ![img_6.png](img_6.png)
   数组展开 $unwind
   ![img_7.png](img_7.png)
   指定字段分组统计 $bucket
   ![img_8.png](img_8.png)
   多个bucket 同时进行统计 $facet
   ![img_9.png](img_9.png)
   复杂查询demo
   ![img_10.png](img_10.png)

7. MongoDB Compass的使用
   ![img_11.png](img_11.png)
























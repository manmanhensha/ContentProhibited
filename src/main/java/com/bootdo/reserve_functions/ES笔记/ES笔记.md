### ES��MySQL�Ķ�Ӧ��ϵ

| ES          | MySQL
   | ------------- | ------ 
| ������indices��   | ���ݿ⣨databases��
| types         | ��table��
| document       | �У�row��
| fileds         | �ֶΣ�columns��

### ES�﷨

1. term ��ȷ��ѯ�������match��ѯЧ�ʸߣ�ʹ���˵���������
2. match ʹ�÷ִʲ�ѯ��ģ����ѯ��keyword���͵����ݲ��ִܷ�
3. ��ѯ���Hits���󣬰�����ѯ���е�������ƥ���ϵ
   ![img.png](img.png)
4. ��ѯ���Hits����
   ![img_1.png](img_1.png)
5. ��ѯʱָ�� <font color=red > _source </font> ��ѯָ���ֶΣ��������
6. ��ѯ sort ��ָ���ֶ��н���������߽���
7. ��ѯ��ҳ �� from �� size ȥָ���൱��limit������������
8. ����ֵ��ѯ bool����������ѯ�� �� must��and����should��or����must_not��not�� filter�������ѯ��->range����Χ��->gt�����ڣ���lt��gte�����ڵ��ڣ���lte
   must��and����should��or�����涼��һ�����飬���ڶ�������ѯ,��һ���ֶ��¿���ʹ�ö���������й���
   ![img_2.png](img_2.png)
9. match ���ֶ�ƥ����ֵ��<font color=red > ����ʹ�ÿո�ֿ� </font>����ѯ���Ľ��������з�ֵ��ƥ��Ĵ�Խ�࣬��ֵԽ���ڲ�ѯ�����б��ǰ��
10. ��ȷ��ѯ���ֵ
    ![img_3.png](img_3.png)
11. �Զ��������ѯ�����ڲ�ѯ��ֵ���߼��ϱ�ǩ
    ![img_4.png](img_4.png)
12. ES��ÿ�����ݶ��������ù��ڹ���
13. ��ѯ��������buildģʽ
    ![img_5.png](img_5.png)
14. ������Ϊ����������󣬺�����������󣬷ֱ𹹽�
15. ��ѯ SearchRequest �������� SearchSourceBuilder �������� HighLightBuiLder �������� TermQueryBuilder ��ȷ��ѯ MatchALLQueryBuiLder
    ƥ��ȫ������ xxxQueryBuiLder ��Ӧ���Ǹղſ���������

16. ����ʹ�������ĵ�
    https://blog.csdn.net/qq_42449963/article/details/124003872
17. ��ѯ���ؽ������ ���մ��ϵ��µ�˳��һ���ĸ�����ֵ��took��timed_out��_shards��hits�� took ���������󻨷��˶೤ʱ�䣬��λ�����롣 timed_out �����Ƿ�ʱ�� shards ������Ƭ��Ϣ��
    total ������Ƭ������ successful �����ɹ��ķ�Ƭ������ skipped û�������ķ�Ƭ�������ķ�Ƭ�� failed ����ʧ�ܵķ�Ƭ������ hits �������������Ŀ�У�������Ҫ��һ�����ݶ��Ǵ�hits�л�ȡ��
    total ���ض��������ݡ� max_score ���ؽ���У�����ƥ��ȷ�ֵ�� hits Ĭ�ϲ�ѯǰʮ�����ݣ����ݷ�ֵ��������
    _index ���������ơ�
    _type �������ơ�
    _id �������ݵ�id��
    _score �ؼ�����������ݵ�ƥ��ȷ�ֵ��
    _source �����������ͣ����ؽ���ֶΣ���ָ���Ļ���Ĭ��ȫ����ʾ������
 











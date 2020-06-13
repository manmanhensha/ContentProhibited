package com.bootdo.reserve_functions.stram_test;

import java.util.*;
import java.util.function.BinaryOperator;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @author wushiqiang
 * @date Created in 16:08 2019/10/12
 * @description
 * @modified By
 */
public class testStreamController {
	public static void main(String[] args) {
		Student s1 = new Student(1L, "肖战", 15, "浙江");
		Student s2 = new Student(2L, "王一博", 15, "湖北");
		Student s3 = new Student(3L, "杨紫", 17, "北京");
		Student s4 = new Student(4L, "李现", 17, "浙江");
		List<Student> students = new ArrayList<>(12);
		students.add(s1);
		students.add(s2);
		students.add(s3);
		students.add(s4);

//		List<Student> streamStudents = testFilter(students);
		List<String> streamStudents = testMap(students);
//		streamStudents.forEach(System.out::println);
//
//		testDistinct1();
//		testDistinct2();
//		testSort1();
//		testSort2(students);
//		testLimit();
//		testSkip();
//		testReduce();
//		testMin(students);
		testFaltmap();
		testMatch(students);
	}

	/**
	 * 筛选
	 *
	 * @param students
	 * @return
	 */
	private static List<Student> testFilter(List<Student> students) {

		//筛选年龄大于15岁的学生
		return students.stream().filter(s -> s.getAge() > 14).collect(Collectors.toList());
		//筛选住在浙江省的学生
//		return students.stream().filter(s -> "浙江".equals(s.getAddress())).collect(Collectors.toList());
	}

	/**
	 * 转map
	 *
	 * @param students
	 * @return
	 */
	private static List<String> testMap(List<Student> students) {
		//在地址前面加上部分信息，只获取地址输出
		return students.stream().map(s -> "住址:" + s.getAddress()).collect(Collectors.toList());
	}

	private static void testDistinct1() {
		//简单字符串的去重
		List<String> list = Arrays.asList("111", "222", "333", "111", "222");

		list.stream().distinct().forEach(System.out::println);
	}

	private static void testDistinct2() {
		//引用对象的去重，引用对象要实现hashCode和equal方法，否则去重无效
		Student s1 = new Student(1L, "肖战", 15, "浙江");
		Student s2 = new Student(2L, "王一博", 15, "湖北");
		Student s3 = new Student(3L, "杨紫", 17, "北京");
		Student s4 = new Student(4L, "李现", 17, "浙江");
		Student s5 = new Student(1L, "肖战", 15, "浙江");
		List<Student> students = new ArrayList<>();
		students.add(s1);
		students.add(s2);
		students.add(s3);
		students.add(s4);
		students.add(s5);

		students.stream().distinct().forEach(System.out::println);
	}

	/**
	 * 集合排序（默认排序）
	 */
	private static void testSort1() {
		List<String> list = Arrays.asList("333", "222", "111");
		list.stream().sorted().forEach(System.out::println);
	}

	/**
	 * 对象排序
	 */
	private static void testSort2(List<Student> students) {
		students.stream().sorted((stu1, stu2) -> Long.compare(stu2.getId(), stu1.getId()))
				.sorted((stu1, stu2) -> Integer.compare(stu2.getAge(), stu1.getAge()))
				.forEach(System.out::println);
	}

	/**
	 * 集合limit，返回前几个元素
	 */
	private static void testLimit() {
		List<String> list = Arrays.asList("333", "222", "111");
		list.stream().limit(2).forEach(System.out::println);
	}

	/**
	 * 集合skip，删除前n个元素
	 * skip 跳过 元素
	 */
	private static void testSkip() {
		List<String> list = Arrays.asList("333", "222", "111");
		list.stream().skip(2).forEach(System.out::println);
	}

	/**
	 * 集合reduce,将集合中每个元素聚合成一条数据
	 */
	private static void testReduce() {
		List<String> list = Arrays.asList("欢", "迎", "你");
		String appendStr = list.stream().reduce("北京", (a, b) -> a + b);
		System.out.println(appendStr);
	}

	/**
	 * 求集合中元素的最小值
	 */
	private static void testMin(List<Student> students) {
//		Student minS = students.stream().min((stu1, stu2) ->Integer.compare(stu1.getAge(),stu2.getAge())).get();
		Student minS = students.stream().max((stu1, stu2) -> Integer.compare(stu1.getAge(), stu2.getAge())).get();

		System.out.println(minS.toString());
	}

	/**
	 * 匹配
	 */
	private static void testMatch(List<Student> students) {
		if (students.stream().anyMatch(s -> "湖北".equals(s.getAddress()))) {
			System.out.println("有湖北人");
		}

		if (students.stream().allMatch(s -> s.getAge() >= 15)) {
			System.out.println("所有学生都满15周岁");
		}

		if (students.stream().noneMatch(s -> "杨洋".equals(s.getName()))) {
			System.out.println("没有叫杨洋的同学");
		}
	}

	/**
	 * map 流
	 */
	private static void testMap(){
		//转成单词的长度 int
		//输出
		Stream.of("apple","banana","orange","waltermaleon","grape")
				.map(String::length)
				.forEach(System.out::println);
		//转成int
		Stream.of("apple", "banana", "orange", "waltermaleon", "grape")
				.mapToInt(String::length)
				.forEach(System.out::println);
		//转成long ,本质上是int 但是存在类型自动转换
		Stream.of("apple", "banana", "orange", "waltermaleon", "grape")
				.mapToLong(e -> e.length())
				.forEach(e -> System.out.println(e));
		//转成Double ，自动类型转换成Double
		Stream.of("apple", "banana", "orange", "waltermaleon", "grape")
				.mapToDouble(e -> e.length())
				.forEach(e -> System.out.println(e));
	}

	/**
	 * flatmap 作用就是将元素拍平拍扁 ，
	 * 将拍扁的元素重新组成Stream，并将这些Stream 串行合并成一条Stream
	 * flatmapToInt、flatmapToLong、flatmapToDouble 跟flatMap 都类似的，
	 * 只是类型被限定了，这里就不在举例子了。
	 */
	private static void testFaltmap(){
		Stream.of("a-b-c-d","e-f-i-g-h")
				.flatMap(e->Stream.of(e.split("-")))
				.forEach(System.out::println);
	}

	/**
	 * peek 挑选 ，将元素挑选出来，可以理解为提前消费
	 */
	private static void testPeek(Student w,Student x,Student y){
		//重新设置名字 变成 年龄+名字
		Stream.of(w,x,y)
				.peek(e->{e.setName(e.getAge()+e.getName());})
				.forEach(e->System.out.println(e.toString()));
	}

	/**
	 * forEachOrdered 适用用于并行流的情况下进行迭代，能保证迭代的有序性
	 */
	private static void testForEachOrdered (){
		Stream.of(0,2,6,5,4,9,8,-1)
				.parallel()
				.forEachOrdered(e->{
					System.out.println(Thread.currentThread().getName()+": "+e);});
	}

	/**
	 * Collectors.toMap() 和Collectors.toConcurrentMap()，见名知义，
	 * 收集成Map和ConcurrentMap，默认使用HashMap和ConcurrentHashMap。
	 * 这里toConcurrentMap()是可以支持并行收集的，这两种类型都有三个重载方法，
	 * 不管是Map 还是ConcurrentMap，他们和Collection的区别是Map 是K-V 形式的，
	 * 所以在收集成Map的时候必须指定收集的K(依据)。这里toMap()和toConcurrentMap()
	 * 最少参数是，key的获取，要存的value。
	 */
	private static void testCollectorsToMap (Student studentA,Student studentB,Student studentC){
		//Function.identity() 获取这个对象本身，那么结果就是Map<String,Student> 即 id->student
//串行收集
		Stream.of(studentA,studentB,studentC)
				.collect(Collectors.toMap(Student::getId, Function.identity()))
				.forEach((aLong, student)
						-> System.out.println(aLong+"---"+student.toString()));
//并发收集
		Stream.of(studentA,studentB,studentC)
				.parallel()
				.collect(Collectors.toConcurrentMap(Student::getId,Function.identity()));
//================================================================================
//Map<String,String> 即 id->name
//串行收集
		Stream.of(studentA,studentB,studentC)
				.collect(Collectors.toMap(Student::getId,Student::getName));
//并发收集
		Stream.of(studentA,studentB,studentC)
				.parallel()
				.collect(Collectors.toConcurrentMap(Student::getId,Student::getName));

		//Map<String,Student>
		Stream.of(studentA, studentB, studentC)
				.collect(Collectors
						.toMap(Student::getId,
								Function.identity(),
								BinaryOperator
										.maxBy(Comparator.comparing(Student::getName))));
//可能上面比较复杂，这编写一个命令式
//Map<String,Student>
		Stream.of(studentA, studentB, studentC)
				.collect(Collectors.toMap(Student::getId, Function.identity(),
								(s1, s2) -> {
									//这里使用compareTo 方法 s1>s2 会返回1,s1==s2 返回0 ，否则返回-1
									if ((s1).getName().compareTo((s2).getName()) < 0) {
										return s2;
									} else {
										return s1;
									}
								}
						));

		//自定义LinkedHashMap
//Map<String,Student>
		Stream.of(studentA, studentB, studentC)
				.collect(Collectors.toMap(Student::getId, Function.identity(),
								BinaryOperator.maxBy(Comparator.comparing(Student::getName)),
								LinkedHashMap::new));

	}


}

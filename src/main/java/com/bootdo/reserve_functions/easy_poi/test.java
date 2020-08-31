package com.bootdo.reserve_functions.easy_poi;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import org.apache.poi.ss.usermodel.Workbook;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author: wushiqiang
 * @Date: Created in 22:03 2020/8/31
 * @Description:
 * @Modified By:
 */
public class test {
	public static void main(String[] args) throws IOException {
		test1();
	}

	/**
	 * 大数据量导出Excel，上百万行
	 *
	 * @throws IOException
	 */
	static void test1() throws IOException {
		List<MsgClient> list = new ArrayList<MsgClient>();
		Workbook workbook = null;
		Date start = new Date();
		ExportParams params = new ExportParams("大数据测试", "测试");
		for (int i = 0; i < 1000000; i++) {  //一百万数据量
			MsgClient client = new MsgClient();
			client.setBirthday(new Date());
			client.setClientName("小明" + i);
			client.setClientPhone("18797" + i);
			client.setCreateBy("JueYue");
			client.setId("1" + i);
			client.setRemark("测试" + i);

			MsgClientGroup group = new MsgClientGroup();
			group.setGroupName("测试" + i);
			client.setGroup(group);
			list.add(client);

			if (list.size() == 10000) {
				workbook = ExcelExportUtil.exportBigExcel(params, MsgClient.class, list);
				list.clear();
			}
		}
		ExcelExportUtil.closeExportBigExcel();
		System.out.println(System.currentTimeMillis() - start.getTime());
		File savefile = new File("D:/excel/");
		if (!savefile.exists()) {
			savefile.mkdirs();
		}
		FileOutputStream fos = new FileOutputStream("D:/excel/ExcelExportBigData.bigDataExport.xlsx");
		assert workbook != null;
		workbook.write(fos);
		fos.close();
	}
}

package com.poly.service;

import java.util.List;

import com.poly.report.ReportCost;
import com.poly.report.ReportProduct;

public interface ReportService {
	List<ReportCost> reportCostInMonth(Integer month);
	List<ReportProduct> reportProductInMonth(Integer month);
}

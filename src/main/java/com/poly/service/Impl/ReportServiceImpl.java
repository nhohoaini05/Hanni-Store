package com.poly.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.ReportCostRepo;
import com.poly.dao.ReportProductRepo;
import com.poly.report.ReportCost;
import com.poly.report.ReportProduct;
import com.poly.service.ReportService;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired ReportCostRepo rpcRepo;
	@Autowired ReportProductRepo rprRepo;
	@Override
	public List<ReportCost> reportCostInMonth(Integer month) {
		List<ReportCost> lst = rpcRepo.reportCost(month);
		return lst;
	}
	@Override
	public List<ReportProduct> reportProductInMonth(Integer month) {
		List<ReportProduct> lst = rprRepo.reportProduct(month);
		return lst;
	}

}

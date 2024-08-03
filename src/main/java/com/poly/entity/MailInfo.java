package com.poly.entity;

import java.io.File;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailInfo {
	private String from = "vietantran1230@gmail.com", to, cc[], bcc[], subject, body;
	private List<File> attachments;
	
	public MailInfo(String to, String subject, String body) {
		this.to = to;
		this.subject = subject;
		this.body = body;
	}
}

package com.example.service;

import java.net.MalformedURLException;

public interface MailService {
	String [] soccer_title() throws MalformedURLException;
	String [] soccer_link() throws MalformedURLException;
	String [] soccer_description() throws MalformedURLException;
	
	String [] baseball_title() throws MalformedURLException;
	String [] baseball_link() throws MalformedURLException;
	String [] baseball_description() throws MalformedURLException;
	
	String [] basketball_title() throws MalformedURLException;
	String [] basketball_link() throws MalformedURLException;
	String [] basketball_description() throws MalformedURLException;
	
	String [] volleyball_title() throws MalformedURLException;
	String [] volleyball_link() throws MalformedURLException;
	String [] volleyball_description() throws MalformedURLException;

	String [] other_title() throws MalformedURLException;
	String [] other_link() throws MalformedURLException;
	String [] other_description() throws MalformedURLException;
}

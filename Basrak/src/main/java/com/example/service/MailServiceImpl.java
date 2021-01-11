package com.example.service;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.springframework.stereotype.Service;

import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.FeedException;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;

@Service
public class MailServiceImpl implements MailService {
		
	//축구 제목
	@Override
	public String [] soccer_title() throws MalformedURLException {
		String rssUrl = "http://www.thesportstimes.co.kr/rss/S1N3.xml";
		URL feedUrl = new URL(rssUrl);
		String [] title = new String [3];
		
		try {
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			List entries = feed.getEntries();
			for (int i = 0; i < 3; i++) {
				SyndEntry entry = (SyndEntry) entries.get(i);
				title[i] = entry.getTitle();
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
		} catch (FeedException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
		return title;
	}
	//축구 링크
	@Override
	public String [] soccer_link() throws MalformedURLException {
		String rssUrl = "http://www.thesportstimes.co.kr/rss/S1N3.xml";
		URL feedUrl = new URL(rssUrl);
		String [] link = new String [3];
		
		try {
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			List entries = feed.getEntries();
			for (int i = 0; i < 3; i++) {
				SyndEntry entry = (SyndEntry) entries.get(i);
				link[i] = entry.getLink();
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
		} catch (FeedException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
		return link;
	}
	//축구 내용
	@Override
	public String [] soccer_description() throws MalformedURLException {
		String rssUrl = "http://www.thesportstimes.co.kr/rss/S1N3.xml";
		URL feedUrl = new URL(rssUrl);
		String [] description = new String [3];
		
		try {
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			List entries = feed.getEntries();
			for (int i = 0; i < 3; i++) {
				SyndEntry entry = (SyndEntry) entries.get(i);
				description[i] = entry.getDescription().getValue();
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
		} catch (FeedException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
		return description;
	}

	@Override
	public String[] baseball_title() throws MalformedURLException {
		String rssUrl = "http://www.thesportstimes.co.kr/rss/S1N1.xml";
		URL feedUrl = new URL(rssUrl);
		String [] title = new String [3];
		
		try {
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			List entries = feed.getEntries();
			for (int i = 0; i < 3; i++) {
				SyndEntry entry = (SyndEntry) entries.get(i);
				title[i] = entry.getTitle();
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
		} catch (FeedException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
		return title;
	}

	@Override
	public String[] baseball_link() throws MalformedURLException {
		String rssUrl = "http://www.thesportstimes.co.kr/rss/S1N1.xml";
		URL feedUrl = new URL(rssUrl);
		String [] link = new String [3];
		
		try {
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			List entries = feed.getEntries();
			for (int i = 0; i < 3; i++) {
				SyndEntry entry = (SyndEntry) entries.get(i);
				link[i] = entry.getLink();
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
		} catch (FeedException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
		return link;
	}

	@Override
	public String[] baseball_description() throws MalformedURLException {
		String rssUrl = "http://www.thesportstimes.co.kr/rss/S1N1.xml";
		URL feedUrl = new URL(rssUrl);
		String [] description = new String [3];
		
		try {
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			List entries = feed.getEntries();
			for (int i = 0; i < 3; i++) {
				SyndEntry entry = (SyndEntry) entries.get(i);
				description[i] = entry.getDescription().getValue();
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
		} catch (FeedException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
		return description;
	}

	@Override
	public String[] basketball_title() throws MalformedURLException {
		String rssUrl = "http://www.thesportstimes.co.kr/rss/S1N5.xml";
		URL feedUrl = new URL(rssUrl);
		String [] title = new String [3];
		
		try {
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			List entries = feed.getEntries();
			for (int i = 0; i < 3; i++) {
				SyndEntry entry = (SyndEntry) entries.get(i);
				title[i] = entry.getTitle();
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
		} catch (FeedException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
		return title;
	}

	@Override
	public String[] basketball_link() throws MalformedURLException {
		String rssUrl = "http://www.thesportstimes.co.kr/rss/S1N5.xml";
		URL feedUrl = new URL(rssUrl);
		String [] link = new String [3];
		
		try {
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			List entries = feed.getEntries();
			for (int i = 0; i < 3; i++) {
				SyndEntry entry = (SyndEntry) entries.get(i);
				link[i] = entry.getLink();
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
		} catch (FeedException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
		return link;
	}

	@Override
	public String[] basketball_description() throws MalformedURLException {
		String rssUrl = "http://www.thesportstimes.co.kr/rss/S1N5.xml";
		URL feedUrl = new URL(rssUrl);
		String [] description = new String [3];
		
		try {
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			List entries = feed.getEntries();
			for (int i = 0; i < 3; i++) {
				SyndEntry entry = (SyndEntry) entries.get(i);
				description[i] = entry.getDescription().getValue();
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
		} catch (FeedException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
		return description;
	}

	@Override
	public String[] volleyball_title() throws MalformedURLException {
		String rssUrl = "http://www.thesportstimes.co.kr/rss/S1N6.xml";
		URL feedUrl = new URL(rssUrl);
		String [] title = new String [3];
		
		try {
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			List entries = feed.getEntries();
			for (int i = 0; i < 3; i++) {
				SyndEntry entry = (SyndEntry) entries.get(i);
				title[i] = entry.getTitle();
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
		} catch (FeedException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
		return title;
	}

	@Override
	public String[] volleyball_link() throws MalformedURLException {
		String rssUrl = "http://www.thesportstimes.co.kr/rss/S1N6.xml";
		URL feedUrl = new URL(rssUrl);
		String [] link = new String [3];
		
		try {
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			List entries = feed.getEntries();
			for (int i = 0; i < 3; i++) {
				SyndEntry entry = (SyndEntry) entries.get(i);
				link[i] = entry.getLink();
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
		} catch (FeedException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
		return link;
	}

	@Override
	public String[] volleyball_description() throws MalformedURLException {
		String rssUrl = "http://www.thesportstimes.co.kr/rss/S1N6.xml";
		URL feedUrl = new URL(rssUrl);
		String [] description = new String [3];
		
		try {
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			List entries = feed.getEntries();
			for (int i = 0; i < 3; i++) {
				SyndEntry entry = (SyndEntry) entries.get(i);
				description[i] = entry.getDescription().getValue();
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
		} catch (FeedException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
		return description;
	}

	@Override
	public String[] other_title() throws MalformedURLException {
		String rssUrl = "http://www.thesportstimes.co.kr/rss/S1N8.xml";
		URL feedUrl = new URL(rssUrl);
		String [] title = new String [3];
		
		try {
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			List entries = feed.getEntries();
			for (int i = 0; i < 3; i++) {
				SyndEntry entry = (SyndEntry) entries.get(i);
				title[i] = entry.getTitle();
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
		} catch (FeedException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
		return title;
	}

	@Override
	public String[] other_link() throws MalformedURLException {
		String rssUrl = "http://www.thesportstimes.co.kr/rss/S1N8.xml";
		URL feedUrl = new URL(rssUrl);
		String [] link = new String [3];
		
		try {
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			List entries = feed.getEntries();
			for (int i = 0; i < 3; i++) {
				SyndEntry entry = (SyndEntry) entries.get(i);
				link[i] = entry.getLink();
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
		} catch (FeedException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
		return link;
	}

	@Override
	public String[] other_description() throws MalformedURLException {
		String rssUrl = "http://www.thesportstimes.co.kr/rss/S1N8.xml";
		URL feedUrl = new URL(rssUrl);
		String [] description = new String [3];
		
		try {
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			List entries = feed.getEntries();
			for (int i = 0; i < 3; i++) {
				SyndEntry entry = (SyndEntry) entries.get(i);
				description[i] = entry.getDescription().getValue();
			}
		} catch (IllegalArgumentException e) {
			System.out.println(e);
		} catch (FeedException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
		return description;
	}

}

package com.bootdo.contentprohibited.service.impl;


import cn.hutool.dfa.WordTree;

import java.util.List;

/**
 * 敏感词工具
 */
class ProhibitedHelper {

	private final WordTree wordTree;

	private ProhibitedHelper() {
		wordTree = new WordTree();
	}

	static ProhibitedHelper getInstance() {
		return Holder.INSTANCE;
	}

	void refresh(List<String> wordList) {
		clear();
		wordTree.addWords(wordList);
	}

	void addWord(String word) {
		wordTree.addWord(word);
	}

	void removeWord(String word) {
		wordTree.remove(word);
	}

	void addWords(String... words) {
		wordTree.addWords(words);
	}

	void addWords(List<String> words) {
		wordTree.addWords(words);
	}

	void removeWordList(List<String> wordList) {
		wordList.forEach(it -> {
			wordTree.remove(it);
		});
	}

	public void clear() {
		wordTree.clear();
	}

	List<String> matchAll(String content) {
		return wordTree.matchAll(content, -1, true, true);
	}

	public WordTree getAll() {
		return wordTree;
	}

	private static class Holder {
		private static ProhibitedHelper INSTANCE = new ProhibitedHelper();
	}

}

/* https://kb.mozillazine.org/User.js_file */

user_pref("extensions.zotero.automaticSnapshots", false);

user_pref("extensions.zotero.dataDir", "/home/nms/Zotero");

user_pref("extensions.zotero.export.citePaperJournalArticleURL", true);
user_pref("extensions.zotero.export.quickCopy.setting", "bibliography=https://raw.githubusercontent.com/nmstreethran/csl-custom-styles/main/harvard-cite-them-right-11th-edition-modified.csl");
user_pref("extensions.zotero.export.translatorSettings", "{\"exportNotes\":false,\"exportFileData\":false,\"useJournalAbbreviation\":false,\"keepUpdated\":true,\"worker\":true,\"includeAnnotations\":false}");

user_pref("extensions.zotero.fileHandler.pdf", "/bin/okular");

user_pref("extensions.zotero.newItemTypeMRU", "book,bookSection,webPage,journalArticle,document");

user_pref("extensions.zotero.translators.better-bibtex.DOIandURL", "doi");
user_pref("extensions.zotero.translators.better-bibtex.citekeyFormat", "authEtal2.lower + year.prefix(_)");
user_pref("extensions.zotero.translators.better-bibtex.citekeyFormatEditing", "authEtal2.lower + year.prefix(_)");
user_pref("extensions.zotero.translators.better-bibtex.exportTitleCase", false);
user_pref("extensions.zotero.translators.better-bibtex.importSentenceCase", "off");
user_pref("extensions.zotero.translators.better-bibtex.skipFields", "abstract,shorttitle,keywords,file,annotation,shortjournal");
user_pref("extensions.zotero.translators.better-bibtex.warnBulkModify", 0);

user_pref("extensions.zotero.useDataDir", true);

user_pref("extensions.zoteroOpenOfficeIntegration.skipInstallation", true);

user_pref("extensions.zotfile.authors_delimiter", ".");
user_pref("extensions.zotfile.dest_dir", "/run/media/nms/Backup/Documents/Zotero");
user_pref("extensions.zotfile.etal", "Etal");
user_pref("extensions.zotfile.import", false);
user_pref("extensions.zotfile.max_titlelength", 50);
user_pref("extensions.zotfile.removeDiacritics", true);
user_pref("extensions.zotfile.removePeriods", false);
user_pref("extensions.zotfile.renameFormat", "{%A}{%y_}{%T}");
user_pref("extensions.zotfile.replace_blanks", false);
user_pref("extensions.zotfile.source_dir", "/run/media/nms/Backup/Documents/Zotero");
user_pref("extensions.zotfile.source_dir_ff", false);
user_pref("extensions.zotfile.truncate_title", false);
user_pref("extensions.zotfile.truncate_title_max", false);
user_pref("extensions.zotfile.wildcards.user",'{"A": {"field": "author", "operations": [{"function": "replace", "regex": "[ ,-.\']", "replacement": ""}]}, "T": {"field": "title", "operations": [{"function": "replace", "regex": "[(),:;?‘’“”!\']", "replacement": ""}, {"function": "replace", "regex": "[×]", "replacement": "x"}, {"function": "replace", "regex": "[°]", "replacement": "deg"}, {"function": "replace", "regex": "\\u0020\\u002d\\u0020", "replacement": "_"}, {"function": "replace", "regex": "\\u0020\\u2013\\u0020", "replacement": "_"}, {"function": "replace", "regex": "\\u0020\\u2014\\u0020", "replacement": "_"}, {"function": "replace", "regex": "\\u0020\\u2015\\u0020", "replacement": "_"}, {"function": "replace", "regex": "[\\u2013\\u2014\\u2015]", "replacement": "-"}, {"function": "replace", "regex": "[ ]", "replacement": "_"}]}}');

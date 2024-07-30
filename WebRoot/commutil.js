/**
 * 去除字符串两端空格
 */
String.prototype.Trim = function() 
{ 
	return this.replace(/^\s+|\s+$/g, "");
} 
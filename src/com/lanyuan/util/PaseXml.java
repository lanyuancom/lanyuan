package com.lanyuan.util;

import java.io.File;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;


public class PaseXml {
	public static boolean doc2XmlFile(Document document, String filename) {
        boolean flag = true;
        try {
           
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer transformer = tFactory.newTransformer();
            DOMSource source = new DOMSource(document);
            StreamResult result = new StreamResult(new File(filename));
            transformer.transform(source, result);
        } catch (Exception ex) {
            flag = false;
            ex.printStackTrace();
        }
        return flag;
    }

    public static Document load(String filename) {
        Document document = null;
        try {
        	// 1.得到DOM解析器的工厂实例
            DocumentBuilderFactory factory = DocumentBuilderFactory
                    .newInstance();
         // 2.从DOM工厂里获取DOM解析器
            DocumentBuilder builder = factory.newDocumentBuilder();
         // 3.解析XML文档，得到document，即DOM树
            document = builder.parse(new File(filename));
          //Document对象调用normalize()，可以去掉XML文档中作为格式化内容的空白而映射在DOM树中的不必要的Text Node对象。
          //否则你得到的DOM树可能并不如你所想象的那样。特别是在输出的时候，这个normalize()更为有用。 
            document.normalize();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return document;
    }

   
    public static void xmlUpdateDemo() {
    	String s = PaseXml.class.getResource("/").toString();
    	s = s.substring(0,s.indexOf("WEB-INF/"));
    	s = s.substring(s.indexOf("D:/"));
    	s = s+"xml/images.xml";
        Document document = load(s);
        try {
        	NodeList list=document.getElementsByTagName("menu");
        	for(int i=0;i<list.getLength();i++){
        	Element brandElement=(Element) list.item(i);
        		brandElement.setAttribute("a", "00");
        	}
        }catch (Exception e) {
		}
        doc2XmlFile(document, s);
    }

    public static void main(String args[]) throws Exception {
    	//PaseXml.xmlUpdateDemo();
    	
    	HttpClientUtils httpClientUtils = new HttpClientUtils();
    	List<String> ls= httpClientUtils.getLinkTagsContent("http://v.youku.com/v_show/id_XNTM4NjY5MDgw.html?f=19121485");
    	for (String object : ls) {
			System.out.println(object);
		}
    }

}

import sys 
import requests 
import lxml.html
import MySQLdb as mdb

#hxs_page is the current page, initialized to the given index page (i.e. Page 1)
home_page = lxml.html.document_fromstring(requests.get("http://www.incredibleindia.org/en/travel/destination").content)

globalctr_state=0
globalctr_city=0

countryID_countryName_dict={}
stateID_stateinfo_dict={}
cityID_cityinfo_dict={}
spotID_spotinfo_dict={}
fareID_fareinfo_dict={}
spotID_fareID_dict={}
typeID_typeinfo_dict={}
hubID_hubinfo_dict={}
conveyanceID_conveyanceinfo_dict={}
hubSpotID_spotID_conveyanceID_dict={}
hotelchainID_hotelchaininfo_dict={}
hotelID_hotelinfo_dict={}
restaurentchainID_restaurentinfo_dict={}
restaurentID_restaurentinfo_dict={}
statename_stateID_dict={}
cityName_cityID_dict={}

destinations=home_page.xpath('//*[@id="main-content"]/div[1]/ul/li')
for i in range(1,len(destinations)+1):
	try:
		city = home_page.xpath('//*[@id="main-content"]/div[1]/ul/li['+str(i)+']/a/span/text()')[0]
	except IndexError:
		city = home_page.xpath('//*[@id="main-content"]/div[1]/ul/li['+str(i)+']/a/text()')[0]	
	print("City: "+city)
	citypage = lxml.html.document_fromstring(requests.get("http://www.incredibleindia.org"+home_page.xpath('//*[@id="main-content"]/div[1]/ul/li['+str(i)+']/a')[0].attrib['href']).content)
	if len(citypage.xpath('//*[@id="left-inner-content"]/div/div/ul/li[2]/ul/li')) is 1:
		statepage = lxml.html.document_fromstring(requests.get("http://www.incredibleindia.org"+citypage.xpath('//*[@id="left-inner-content"]/div/div/ul/li[2]/ul/li[1]/a')[0].attrib['href']).content)
	if len(citypage.xpath('//*[@id="left-inner-content"]/div/div/ul/li[2]/ul/li')) is 2:
		statepage = lxml.html.document_fromstring(requests.get("http://www.incredibleindia.org"+citypage.xpath('//*[@id="left-inner-content"]/div/div/ul/li[2]/ul/li[2]/a')[0].attrib['href']).content)
	elif len(citypage.xpath('//*[@id="left-inner-content"]/div/div/ul/li[2]/ul/li')) is 3:
		statepage = lxml.html.document_fromstring(requests.get("http://www.incredibleindia.org"+citypage.xpath('//*[@id="left-inner-content"]/div/div/ul/li[2]/ul/li[3]/a')[0].attrib['href']).content)
	cityinfo={}
	try:
		cityinfo['Name'] = city
	except IndexError:
		cityinfo['Name']=""
	try:
		statename = statepage.xpath('//*[@id="article-content"]/div/h2/text()')[0].strip(' ')[0]
		stateinfo = {}
		if statename not in statename_stateID_dict:
			globalctr_state += 1
			statename_stateID_dict[statename] = globalctr_state
			stateinfo['StateID'] = globalctr_state
			stateinfo['StateName'] = statename
			stateinfo['CountryID'] = 0	#only IN yet
			stateID_stateinfo_dict[globalctr_state] = stateinfo
		cityinfo['StateID'] = statename_stateID_dict[statename]	 
		print("StateID: "+str(cityinfo['StateID']))
	except IndexError:
		cityinfo['StateID'] = -1
	try:
		cityinfopage = lxml.html.document_fromstring(requests.get("http://www.incredibleindia.org"+citypage.xpath('//*[@id="left-inner-content"]/div/div/ul/li[1]/a')[0].attrib['href']).content)
		writtenmat = cityinfopage.xpath('//*[@id="article-content"]/div/div[2]/div[1]/div/div[2]/text()')
		pincode=""
		for items in writtenmat:
			if city+'-' in items:
				pincode = items[items.rfind('-',0,len(items))+1:-1].replace(' ','')
		cityinfo['Pincode'] = pincode
		print("Pincode: "+pincode)
	except IndexError:
		cityinfo['Pincode'] = ""
	if city not in cityName_cityID_dict:
		globalctr_city += 1
		cityinfo['CityID'] = globalctr_city
		cityID_cityinfo_dict[globalctr_city] = cityinfo
	print("cityinfo: ")
	print (cityinfo)


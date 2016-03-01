require 'Mechanize'

def register(univ_code)
  agent = Mechanize.new

  puts "Getting URL for school: #{univ_code}"
  agent.get "https://www.collegecentral.com/CCNEngine/EmployersJobs/EmpRegForm.CFM?UnivCode=#{univ_code}"

  puts "Checking for valid url"
  if valid_url
    puts "filling out form"

    form = agent.page.forms.first
    form.ContactName = "David Ladowitz"
    form.CompanyName = "Desta"
    form.CompanyAddr1 = "777 ash street #309"
    form.CompanyCity = "Denver"
    form.CompanyState = "CO"
    form.CompanyZip = "08220"
    form.CompanyPhone = "408 666 4411"
    form.CompanyEMail = "david@desta.co"
    form.CompanyURL = "desta.co"
    form.CompanyDesc = "Dests helps people who love the outdoors find summer & winter jobs. We specialize in rafting, climbing, skiing, summer camps, hiking, guiding and national parks."
    form.EEOC = "dl"
    form.checkboxes.first.value = "0"
    form.Industry = ["11", "47", "59"]
    form.AccessID = "dladowitz"

    puts "submitting form"
    form.submit
    puts "submitting form"
  end
end


File.open('/Users/david/Documents/repos/thinkafy/collegecentralafy/output.html', "wb") { |f| f.write(JSON.parse(agent.page.body).pack('C*')) }

def valid_url?(agent)
  if agent.page.body.include? "ContactName"
    puts "URL is valid"
    return true
  else
    puts "URL is no good, :("
    return false
  end
end




# agent = Mechanize.new
# agent.get "https://www.collegecentral.com/CCNEngine/EmployersJobs/EmpRegForm.CFM?UnivCode=mcc"
# form = agent.page.forms.first
# form.ContactName = "Jack Braunson"
# form.CompanyName = "Braunson Consulting"
# form.CompanyAddr1 = "200 First st"
# form.CompanyCity = "San Diego"
# form.CompanyState = "California"
# form.CompanyZip = "95001"
# form.CompanyPhone = "302 999 8090"
# form.CompanyEMail = "jackb10@gmail.com"
# form.CompanyURL = "wwwjbconsulting.com"
# form.CompanyDesc = "We help make the internet better"
# form.EEOC = "jb"
# form.checkboxes.first.value = "0"
# form.AccessID = "jbraun"
# form.submit
# File.open('/Users/david/Documents/repos/thinkafy/collegecentralafy/output.html', "wb") { |f| f.write(JSON.parse(agent.page.body).pack('C*')) }

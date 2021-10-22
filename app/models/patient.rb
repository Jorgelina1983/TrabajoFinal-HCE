class Patient < ApplicationRecord
#   belongs_to :user
    has_many :allergies
    has_many :surgeries
    has_many :medications
    has_many :appointments

  validates :first_name, :email, :dob, presence: :true

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def to_hl7
    {
        "resourceType": "Person",
        "id": "example",
        "text": {
            "status": "generated"
        },
        "identifier": [
            {
            "use": "usual",
            "type": {
                "coding": [
                {
                    "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                    "code": "MR"
                }
                ]
            },
            "system": "urn:oid:1.2.36.146.595.217.0.1",
            "value": identification
            }
        ],
        "name": [
            {
            "use": "official",
            "family": last_name,
            "given": [
                first_name
            ]
            },
            {
            "use": "usual",
            "given": [
                "Jim"
            ]
            }
        ],
        "telecom": [
            {
            "use": "home"
            },
            {
            "system": "phone",
            "value": phone,
            "use": "work"
            },
            {
            "system": "email",
            "value": email,
            "use": "home"
            }
        ],
        "gender": gender,
        "birthDate": dob,
        "address": [
            {
            "use": "home",
            "line": [
                address
            ],
            "city": "PleasantVille",
            "state": "Vic",
            "postalCode": "3999"
            }
        ],
        "active": true
    }.to_json
  end
end

# {"resourceType":"Person","id":"example","text":{"status":"generated"},"identifier":[{"use":"usual","type":{"coding":[{"system":"http://terminology.hl7.org/CodeSystem/v2-0203","code":"MR"}]},"system":"urn:oid:1.2.36.146.595.217.0.1","value":"PATIENT-3"}],"name":[{"use":"official","family":"Test","given":["Patient "]},{"use":"usual","given":["Testing"]}],"telecom":[{"use":"home"},{"system":"phone","value":"2914251921","use":"work"},{"system":"email","value":"melisa@test.com","use":"home"}],"gender":"Femenino","birthDate":"1983-11-04","address":[{"use":"home","line":["El Resero 890"],"city":"PleasantVille","state":"Vic","postalCode":"8000"}],"active":true}

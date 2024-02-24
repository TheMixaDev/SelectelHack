package database

import "time"

type User struct {
	Id                   string    `json:"id"`
	DateJoined           time.Time `json:"date_joined"`
	Username             string    `json:"username"`
	FirstName            string    `json:"first_name"`
	LastName             string    `json:"last_name"`
	MiddleName           string    `json:"middle_name"`
	MaidenName           string    `json:"maiden_name"`
	BirthDate            string    `json:"birth_date"`
	Gender               string    `json:"gender"`
	Email                string    `json:"email"`
	Phone                string    `json:"phone"`
	LoginViaPhone        bool      `json:"login_via_phone"`
	About                string    `json:"about"`
	CityId               string    `json:"city_id"`
	City                 string    `json:"city"`
	IsPin20              bool      `json:"is_pin_20"`
	IsPin100             bool      `json:"is_pin_100"`
	DonationAgg          string    `json:"donation_agg"`
	Socials              string    `json:"socials"`
	Photo                string    `json:"photo"`
	PhotoId              uint      `json:"photo_id"`
	NextDonationDate     time.Time `json:"next_donation_date"`
	NextDonation         time.Time `json:"next_donation"`
	BloodGroup           string    `json:"blood_group"`
	HashPassword         string    `json:"hash_password"`
	IsEmailVerified      bool      `json:"is_email_verified"`
	IsPhoneVerified      bool      `json:"is_phone_verified"`
	EmailReconfirmedAt   string    `json:"email_reconfirmed_at"`
	PhoneReconfirmedAt   string    `json:"phone_reconfirmed_at"`
	LegacyAvatar         string    `json:"legacy_avatar"`
	StartDonorYear       time.Time `json:"start_donor_year"`
	ReferalCode          string    `json:"referal_code"`
	ParentUser           string    `json:"parent_user"`
	InvitedUsers         string    `json:"invited_users"`
	DonorStatus          string    `json:"donor_status"`
	ManagedOrganizations string    `json:"managed_organizations"`
	JoinedEvents         string    `json:"joined_events"`
	JoinedOrganizations  time.Time `json:"joined_organizations"`
	DonorCertificate     bool      `json:"donor_certificate"`
	DonorCardId          uint      `json:"donor_card_id"`
}
type DonationCreate struct {
	ID               int `json:"id"`
	BloodStationID   int `json:"blood_station_id,omitempty"`
	Image            string
	ImageID          int       `json:"image_id,omitempty"`
	CityID           int       `json:"city_id"`
	LegacyImage      string    `json:"legacy_image,omitempty"`
	HasReply         string    `json:"has_reply,omitempty"`
	ReplyViewed      string    `json:"reply_viewed,omitempty"`
	AllowedModify    string    `json:"allowed_modify,omitempty"`
	FirstName        string    `json:"first_name,omitempty"`
	LastName         string    `json:"last_name,omitempty"`
	MiddleName       string    `json:"middle_name,omitempty"`
	CreatedAt        time.Time `json:"created_at"`
	UpdatedAt        time.Time `json:"updated_at"`
	Status           string    `json:"status"`
	RejectReason     string    `json:"reject_reason,omitempty"`
	DonateAt         string    `json:"donate_at,omitempty"`
	BloodClass       string    `json:"blood_class,omitempty"`
	PaymentType      string    `json:"payment_type,omitempty"`
	IsOut            bool      `json:"is_out,omitempty"`
	Volume           float64   `json:"volume,omitempty"`
	PaymentCost      float64   `json:"payment_cost,omitempty"`
	OnModerationDate string    `json:"on_moderation_date,omitempty"`
	WithImage        bool      `json:"with_image,omitempty"`
	CreatedUsingOCR  bool      `json:"created_using_ocr,omitempty"`
	User             int       `json:"user"`
}

type DonationDetail struct {
	ID                     int `json:"id"`
	BloodStationID         int `json:"blood_station_id,omitempty"`
	Image                  string
	ImageID                int       `json:"image_id,omitempty"`
	CityID                 int       `json:"city_id"`
	LegacyImage            string    `json:"legacy_image,omitempty"`
	HasReply               string    `json:"has_reply,omitempty"`
	ReplyViewed            string    `json:"reply_viewed,omitempty"`
	AllowedModify          string    `json:"allowed_modify,omitempty"`
	Feedback               string    `json:"feedback,omitempty"`
	FavoriteBloodStationID string    `json:"favorite_blood_station_id,omitempty"`
	CreatedAt              time.Time `json:"created_at"`
	UpdatedAt              time.Time `json:"updated_at"`
	Status                 string    `json:"status"`
	RejectReason           string    `json:"reject_reason,omitempty"`
	DonateAt               string    `json:"donate_at,omitempty"`
	BloodClass             string    `json:"blood_class,omitempty"`
	PaymentType            string    `json:"payment_type,omitempty"`
	IsOut                  bool      `json:"is_out,omitempty"`
	Volume                 string    `json:"volume,omitempty"`
	PaymentCost            string    `json:"payment_cost,omitempty"`
	OnModerationDate       time.Time `json:"on_moderation_date,omitempty"`
	WithImage              bool      `json:"with_image,omitempty"`
	CreatedUsingOCR        bool      `json:"created_using_ocr,omitempty"`
	User                   string    `json:"user"`
}

type DonationPlan struct {
	ID           int    `json:"id"`
	Event        string `json:"event"`
	BloodStation string
	City         string
	CreatedAt    time.Time `json:"created_at"`
	UpdatedAt    time.Time `json:"updated_at"`
	ObjectID     int       `json:"object_id,omitempty"`
	BloodClass   string    `json:"blood_class,omitempty"`
	PlanDate     string    `json:"plan_date"`
	PaymentType  string    `json:"payment_type,omitempty"`
	Status       string    `json:"status,omitempty"`
	IsOut        bool      `json:"is_out"`
	User         int       `json:"user"`
	ContentType  int       `json:"content_type,omitempty"`
	Donation     int       `json:"donation,omitempty"`
}

type DonorCard struct {
	BloodGroup                 string `json:"blood_group,omitempty"`
	Kell                       string `json:"kell,omitempty"`
	Blood                      bool   `json:"blood,omitempty"`
	Plasma                     bool   `json:"plasma,omitempty"`
	Platelets                  bool   `json:"platelets,omitempty"`
	Erythrocytes               bool   `json:"erythrocytes,omitempty"`
	Leukocytes                 bool   `json:"leukocytes,omitempty"`
	CantDonate                 bool   `json:"cant_donate,omitempty"`
	CantDonateDisqualification bool   `json:"cant_donate_disqualification,omitempty"`
	CantDonateSurgery          bool   `json:"cant_donate_surgery,omitempty"`
	CantDonateLactation        bool   `json:"cant_donate_lactation,omitempty"`
	CantDonateOther            bool   `json:"cant_donate_other,omitempty"`
	CantDonateDonor            bool   `json:"cant_donate_donor,omitempty"`
	CantDonateNotice           string `json:"cant_donate_notice,omitempty"`
	BoneDonor                  bool   `json:"bone_donor,omitempty"`
	DonationsBeforeReg         int    `json:"donations_before_reg,omitempty"`
	DonorStatus                int    `json:"donor_status,omitempty"`
}

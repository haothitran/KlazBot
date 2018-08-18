--------------------------------------------------------------------------------
-- // MODULES / MAIL
--------------------------------------------------------------------------------
-- set subject when sending/requesting money

local function mailSubject(self)
	if self:GetText() ~= "" and SendMailSubjectEditBox:GetText() == "" then
		SendMailSubjectEditBox:SetText(MONEY)
	end
end

SendMailMoneyGold:HookScript("OnTextChanged", mailSubject)
SendMailMoneySilver:HookScript("OnTextChanged", mailSubject)
SendMailMoneyCopper:HookScript("OnTextChanged", mailSubject)

-- FP Zone
local s, id = GetID()

function s.initial_effect(c)
	local e1 = Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id, 0))
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_STARTUP)
	e1:SetCountLimit(1, {id, 0}, EFFECT_COUNT_CODE_DUEL)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	e1:SetRange(LOCATION_EXTRA)
	c:RegisterEffect(e1)
end

function s.filter(c, e, tp)
	return true
end

function s.target(e, tp, eg, ep, ev, re, r, rp, chk)
	if chk == 0 then
		return true
	end
	return Duel.SetOperationInfo(0, CATEGORY_SPECIAL_SUMMON, nil, 1, tp, LOCATION_EXTRA)
end

function s.operation(e, tp, eg, ep, ev, re, r, rp)
	local c = e:GetHandler()
	if not c:IsRelateToEffect(e) then
		return
	end

	if Duel.SpecialSummon(c, 0, tp, tp, true, false, POS_ATTACK, 1)
end

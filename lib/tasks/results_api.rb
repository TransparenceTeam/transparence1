class VoteResults

  def execute

    project_laws = ProjectLaw.all#
    votes = Vote.all
    deputies = Deputy.all
    political_groups = PoliticalGroup.all

    lrem_for = 0
    lrem_against = 0
    lrem_abstention = 0

    modem_for = 0
    modem_for_against = 0
    modem_for_abstention = 0

    soc_for = 0
    soc_against = 0
    soc_abstention = 0

    lr_for = 0
    lr_against = 0
    lr_abstention = 0

    gdr_for = 0
    gdr_against = 0
    gdr_abstention = 0

    lt_for = 0
    lt_against = 0
    lt_abstention = 0

    ae_for = 0
    ae_against = 0
    ae_abstention = 0

    udi_for = 0
    udi_against = 0
    udi_abstention = 0

    ni_for = 0
    ni_against = 0
    ni_abstention = 0

    lfi_for = 0
    lfi_against = 0
    lfi_abstention = 0

    uai_for = 0
    uai_against = 0
    uai_abstention = 0

    project_laws.each do |law|
      votes.each do |vote|
        if law.id == vote.project_law_id
          deputies.each do |deputy|
            if vote.deputy_id == deputy.id
              political_groups.each do |group|
                if deputy.political_group_id == group.id
                  if group.ref == 'LREM'
                    if vote.position == 'abstention'
                      lrem_abstention += 1
                    elsif vote.position == 'pour'
                      lrem_for += 1
                    elsif vote.position == 'contre'
                      lrem_against += 1
                    end
                  end
                  if group.ref == 'MODEM'
                    if vote.position == 'abstention'
                      modem_for_abstention += 1
                    elsif vote.position == 'pour'
                      modem_for += 1
                    elsif vote.position == 'contre'
                      modem_for_against += 1
                    end
                  end
                  if group.ref == 'SOC'
                    if vote.position == 'abstention'
                      soc_abstention += 1
                    elsif vote.position == 'pour'
                      soc_for += 1
                    elsif vote.position == 'contre'
                      soc_against += 1
                    end
                  end
                  if group.ref == 'LR'
                    if vote.position == 'abstention'
                      lr_abstention += 1
                    elsif vote.position == 'pour'
                      lr_for += 1
                    elsif vote.position == 'contre'
                      lr_against += 1
                    end
                  end
                  if group.ref == 'GDR'
                    if vote.position == 'abstention'
                      gdr_abstention += 1
                    elsif vote.position == 'pour'
                      gdr_for += 1
                    elsif vote.position == 'contre'
                      gdr_against += 1
                    end
                  end
                  if group.ref == 'NG'
                    if vote.position == 'abstention'
                      ae_abstention += 1
                    elsif vote.position == 'pour'
                    elsif vote.position == 'contre'
                    end
                  end
                  if group.ref == 'LT'
                    if vote.position == 'abstention'
                      lt_abstention += 1
                    elsif vote.position == 'pour'
                      lt_for += 1
                    elsif vote.position == 'contre'
                      lt_against += 1
                    end
                  end
                  if group.ref == 'AE'
                    if vote.position == 'abstention'
                      ae_abstention += 1
                    elsif vote.position == 'pour'
                      ae_for += 1
                    elsif vote.position == 'contre'
                      ae_against += 1
                    end
                  end
                  if group.ref == 'UDI'
                    if vote.position == 'abstention'
                      udi_abstention += 1
                    elsif vote.position == 'pour'
                      udi_for += 1
                    elsif vote.position == 'contre'
                      udi_against += 1
                    end
                  end
                  if group.ref == 'NI'
                    if vote.position == 'abstention'
                      ni_abstention += 1
                    elsif vote.position == 'pour'
                      ni_for += 1
                    elsif vote.position == 'contre'
                      ni_against += 1
                    end
                  end
                  if group.ref == 'LFI'
                    if vote.position == 'abstention'
                      lfi_abstention += 1
                    elsif vote.position == 'pour'
                      lfi_for += 1
                    elsif vote.position == 'contre'
                      lfi_against += 1
                    end
                  end
                  if group.ref == 'UAI'
                    if vote.position == 'abstention'
                      uai_abstention += 1
                    elsif vote.position == 'pour'
                      uai_for += 1
                    elsif vote.position == 'contre'
                      uai_against += 1
                    end
                  end
                end
              end
            end
          end
        end
      end
      if law.LREM_positions.nil?
        lrem_score = ProjectLaw.find_by(id: law.id)
        lrem_score.update(LREM_positions: "#{lrem_for}-#{lrem_against}-#{lrem_abstention}")
        lrem_score.update(MODEM_positions: "#{modem_for}-#{modem_for_against}-#{modem_for_abstention}")
        lrem_score.update(SOC_positions: "#{soc_for}-#{soc_against}-#{soc_abstention}")
        lrem_score.update(LR_positions: "#{lr_for}-#{lr_against}-#{lr_abstention}")
        lrem_score.update(GDR_positions: "#{gdr_for}-#{gdr_against}-#{gdr_abstention}")
        lrem_score.update(LT_positions: "#{lt_for}-#{lt_against}-#{lt_abstention}")
        lrem_score.update(AE_positions: "#{ae_for}-#{ae_against}-#{ae_abstention}")
        lrem_score.update(UDI_positions: "#{udi_for}-#{udi_against}-#{udi_abstention}")
        lrem_score.update(NI_positions: "#{ni_for}-#{ni_against}-#{ni_abstention}")
        lrem_score.update(LFI_positions: "#{lfi_for}-#{lfi_against}-#{lfi_abstention}")
        lrem_score.update(UAI_positions: "#{uai_for}-#{uai_against}-#{uai_abstention}")
        puts law.name
        puts "LREM FOR: #{lrem_for} - AGAINST: #{lrem_against} - Abstencion: #{lrem_abstention}"
        puts "MODEM FOR: #{modem_for} - AGAINST: #{modem_for_against} - Abstencion: #{modem_for_abstention}"
        puts "SOC FOR: #{soc_for} - AGAINST: #{soc_against} - Abstencion: #{soc_abstention}"
        puts "LR FOR: #{lr_for} - AGAINST: #{lr_against} - Abstencion: #{lr_abstention}"
        puts "GDR FOR: #{gdr_for} - AGAINST: #{gdr_against} - Abstencion: #{gdr_abstention}"
        puts "LT FOR: #{lt_for} - AGAINST: #{lt_against} - Abstencion: #{lt_abstention}"
        puts "AE FOR: #{ae_for} - AGAINST: #{ae_against} - Abstencion: #{ae_abstention}"
        puts "UDI FOR: #{udi_for} - AGAINST: #{udi_against} - Abstencion: #{udi_abstention}"
        puts "NI FOR: #{ni_for} - AGAINST: #{ni_against} - Abstencion: #{ni_abstention}"
        puts "LFI FOR: #{lfi_for} - AGAINST: #{lfi_against} - Abstencion: #{lfi_abstention}"
        puts "UAI FOR: #{uai_for} - AGAINST: #{uai_against} - Abstencion: #{uai_abstention}"
      end
    end
  end
end


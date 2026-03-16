local cfg = {}
----------- Staff -----------------
----------------------------------------------------
cfg.groups = {
	["Dono"] = {
		"dono.permissao",
		"staff.permissao",
		"wl.permissao",
		"polpar.permissao",
		"ticket.permissao",
		"wall.permissao",
		"prop.permissao",
		"imune.permissao",
		"player.noclip"
			
    },
	    ["OffDono"] = {
    	"offdono.permissao",
    	"sem.permissao"
    

    },


	["CTO"] = {
		"cto.permissao",
		"staff.permissao",
		"wl.permissao",
		"polpar.permissao",
		"ticket.permissao",
		"wall.permissao",
		"prop.permissao",
		"imune.permissao",
		"player.noclip"
			
    },
	    ["OffCTO"] = {
    	"offcto.permissao",
    	"sem.permissao"
    

    },

	["COO"] = {
		"coo.permissao",
        "staff.permissao",
		"wl.permissao",
		"polpar.permissao",
		"ticket.permissao",
		"wall.permissao",
		"prop.permissao",
		"imune.permissao",
		"player.noclip"
			
    },
	    ["OffCOO"] = {
    	"offcoo.permissao",
    	"sem.permissao"
    

    },

	["SPV"] = {
        "spv.permissao",
		"staff.permissao",
		"polpar.permissao",
		"ticket.permissao",
		"wall.permissao",
		"prop.permissao",
		"imune.permissao",
		"player.noclip"
			
    },
	    ["OffSPV"] = {
    	"offspv.permissao",
    	"sem.permissao"
    

    },

	["Admin"] = {
		"admin.permissao",
		"staff.permissao",
		"polpar.permissao",
		"wall.permissao",
		"prop.permissao",
		"imune.permissao",
		"ticket.permissao",
		"player.noclip"
		
	},
		["OffAdmin"] = {
		"offadmin.permissao",
		"sem.permissao"

		
	},
	["Mod"] = {
		"mod.permissao",
		"staff.permissao",
		"polpar.permissao",
		"wall.permissao",
		"ticket.permissao",
		"imune.permissao",
		"player.noclip"
		
	},
		["OffMod"] = {
		"offmod.permissao",
		"sem.permissao"
	},
	["Suporte"] = {
		"suporte.permissao",
		"staff.permissao",
		"ticket.permissao",
		"imune.permissao",
		"player.noclip"
		
	},
		["OffSuporte"] = {
		"offsuporte.permissao",
		"sem.permissao"
	},
	["Whitelist"] = {
		"wl.permissao"
	},
	--------------------OAB e Advogado---------------------------------
	["Juiz"] = {
		_config = {
			title = "Juiz",
			gtype = "job"
		},
		"juiz.permissao",
		"portadp.permissao",
		"portaoab.permissao",
		"sem.permissao"
	},

	["PaisanaJuiz"] = {
		_config = {
			title = "Juiz Paisana",
			gtype = "job"
		},
		"sem.permissao"
	},

	
	["Advogado"] = {
		_config = {
			title = "Advogado",
			gtype = "job"
		},
		"advogado.permissao",
		"portadp.permissao"
		"portaoab.permissao",
		"sem.permissao"
	},

	["PaisanaAdvogado"] = {
		_config = {
			title = "Advogado Paisana",
			gtype = "job"
		},
		"sem.permissao"
	},
	----------- Departamentod e Policia -----------------
	-----------------------------------------------------
	-- Recruta
	["Recruta"] = {
		_config = {
			title = "Recruta",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"recruta.servico",
		"recruta.arsenal",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaRecruta"] = {
		_config = {
			title = "Recruta Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"recruta.folga",
		"sem.permissao"
	},
		["Cabo"] = {
		_config = {
			title = "Cabo",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"cabo.permissao",
		"recruta.arsenal",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaCabo"] = {
		_config = {
			title = "Cabo Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanacabo.permissao",
		"sem.permissao"
	},
			["Major"] = {
		_config = {
			title = "Major",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"major.permissao",
		"recruta.arsenal",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaMajor"] = {
		_config = {
			title = "Major Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanamajor.permissao",
		"sem.permissao"
	},

	-- Soldado
	["Soldado"] = {
		_config = {
			title = "Soldado",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"soldesarg.arsenal",
		"portadp.permissao",
		"soldado.servico",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaSoldado"] = {
		_config = {
			title = "Soldado Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"soldado.folga",
		"sem.permissao"
	},
	-- Sargento
	["Sargento"] = {
		_config = {
			title = "Sargento",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"soldesarg.arsenal",
		"sargento.servico",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaSargento"] = {
		_config = {
			title = "Sargento Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"sargento.folga",
		"sem.permissao"
	},
	-- Tenete
	["Tenente"] = {
		_config = {
			title = "Tenente",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"tenenteecoronel.arsenal",
		"tenente.servico",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaTenente"] = {
		_config = {
			title = "Tenente Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"tenente.folga",
		"sem.permissao"
	},
	-- Capitão
	["Capitão"] = {
		_config = {
			title = "Capitão",
			gtype = "job"
		},
		"policia.permissao",
		"pmerj.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"capitaoecoronel.arsenal",
		"capitao.servico",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaCapitão"] = {
		_config = {
			title = "Capitão Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"capitao.folga",
		"sem.permissao"
	},
	["Coronel"] = {
		_config = {
			title = "Coronel",
			gtype = "job"
		},
		"policia.permissao",
		"polpar.permissao",
		"pmerj.permissao",
		"portadp.permissao",
		"tenenteecoronel.arsenal",
		"coronel.servico",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaCoronel"] = {
		_config = {
			title = "Coronel Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"coronel.folga",
		"sem.permissao"
	},
	["Aspirante"] = {
		_config = {
			title = "Aspirante",
			gtype = "job"
		},
		"policia.permissao",
		"polpar.permissao",
		"pmerj.permissao",
		"portadp.permissao",
		"aspirante.permissao",
		"player.noclip",
		"sem.permissao"
	},
	["PaisanaAspirante"] = {
		_config = {
			title = "Aspirante Folga",
			gtype = "job"
		},
		"paisanaaspirante.permissao",
		"sem.permissao"
	},
	["ComandanteGeral"] = {
		_config = {
			title = "Comandante Geral",
			gtype = "job"
		},
		"policia.permissao",
		"comandantegeral.permissao",
		"player.noclip"
	},
	["PaisanaComandanteGeral"] = {
		_config = {
			title = "Comandante Geral Folga",
			gtype = "job"
		},
		"paisanacomandantegeral.permissao",
		"sem.permissao"
	},

	-----------------------------------------------------------------
	------------------- Policia civil
	-----------------------------------------------------------------
	["Investigador"] = {
		_config = {
			title = "Investigador",
			gtype = "job"
		},
		"policia.permissao",
		"investigador.permissao",
 	    "player.noclip",
		"polpar.permissao",
		"sem.permissao"
	},
	["PaisanaInvestigador"] = {
		_config = {
			title = "Investigador Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanainvestigador.permissao",
		"sem.permissao"
	},
	["Escrivao"] = {
		_config = {
			title = "Escrivão",
			gtype = "job"
		},
		"policia.permissao",
		"escrivao.permissao",
		"polpar.permissao",
 	    "player.noclip",
		"sem.permissao"
	},
	["PaisanaEscrivao"] = {
		_config = {
			title = "Escrivão Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanaescrivao.permissao",
		"sem.permissao"
	},
	["DelegadoPC"] = {
		_config = {
			title = "Delegado Policia Civil",
			gtype = "job"
		},
		"policia.permissao",
		"delegadopc.permissao",
		"polpar.permissao",
 	    "player.noclip",
		"sem.permissao"
	},
	["PaisanaDelegadoPC"] = {
		_config = {
			title = "Delegado PC Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanadelegadopc.permissao",
		"sem.permissao"
	},
	
	
	----------------------------------------------------
	-- Hospital ------------------------------------
	-----------------------------------------------------

		["ResidenteHP"] = {
		_config = {
			title = "Residente HP",
			gtype = "job"
		},
		"hp.permissão",
		"residentehp.permissao",
		"paramedico.permissao",
		"player.noclip",
		"player.blips"
	}, 
	["PaisanaResidenteHP"] = {
		_config = {
			title = "Residente HP Folga",
			gtype = "job"
		},
		"paisanaenresidente.permissao",
		"sem.permissao"	,	
		"player.blips"
	},
	["MedicoHP"] = {
		_config = {
			title = "Medico HP",
			gtype = "job"
		},
		"hp.permissão",
		"medicohp.permissao",
		"paramedico.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaMedicoHP"] = {
		_config = {
			title = "Medico HP Folga",
			gtype = "job"
		},
		"paisanamedicohp.permissao",
		"sem.permissao",
		"player.blips"
	}, 
	
	["AuxDiretoriaHP"] = {
		_config = {
			title = "Aux da Diretoria HP",
			gtype = "job"
		},
		"hp.permissão",
		"diretoria.permissao",
		"paramedico.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaAuxDiretoriaHP"] = {
		_config = {
			title = "Aux da Diretoria HP Folga",
			gtype = "job"
		},
		"paisanadiretoriahp.permissao",
		"sem.permissao",
		"player.blips"
	},


	["ViceDiretorHP"] = {
		_config = {
			title = "Vice Diretor HP",
			gtype = "job"
		},
		"hp.permissão",
		"diretoria.permissao",
		"player.noclip",
		"paramedico.permissao",
		"player.blips"
	}, 
	["PaisanaViceDiretorHP"] = {
		_config = {
			title = "Vice Diretor HP folga",
			gtype = "job"
		},
		"paisanadiretoriahp.permissao",
		"sem.permissao",
		"player.blips"
	}, 

	["DiretorHP"] = {
		_config = {
			title = "Diretor HP",
			gtype = "job"
		},
		"hp.permissão",
		"diretoria.permissao",
		"paramedico.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaDiretorHP"] = {
		_config = {
			title = "Diretor HP Folga",
			gtype = "job"
		},
		"paisanadiretoriahp.permissao",
		"sem.permissao",
		"player.blips"
	},

	------------------------------------------------------------------------------------------
	----------------- Mecânica  --------------------------------------------------------

	["LiderMc"] = {
		_config = {
			title = "Lider da Macanica",
			gtype = "job"
		},
		"liderMc.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"mecanico.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaLiderMc"] = {
		_config = {
			title = "Lider da Mecanica Folga",
			gtype = "job"
		},
		"paisanaliderMc.permissao",
		"sem.permissao",
		"player.blips"
	},
	["ViceLiderM"] = {
		_config = {
			title = "ViceLider da Mecanica",
			gtype = "job"
		},
		"diretoriamc.permissao",
		"mecanico.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaViceLiderMC"] = {
		_config = {
			title = "ViceLider da Mecanica Folga",
			gtype = "job"
		},
		"paisanadiretoriamc.permissao",
		"sem.permissao",
		"player.blips"
	},
	["GerenteMc"] = {
		_config = {
			title = "Gerente da Mecanica",
			gtype = "job"
		},
		"diretoriamc.permissao",
		"mecanico.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaGerenteMc"] = {
		_config = {
			title = "Gerente da Mecanica Folga",
			gtype = "job"
		},
		"paisanadirotoriamc.permissao",
		"sem.permissao",
		"player.blips"
	},
	["TunagemMc"] = {
		_config = {
			title = "Tuning da Mecanica",
			gtype = "job"
		},
		"tunagemMc.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"mecanico.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaTunagemMc"] = {
		_config = {
			title = "Tuning da Mecanica Folga",
			gtype = "job"
		},
		"paisanatunagemMc.permissao",
		"sem.permissao",
		"player.blips"
	},
	["ReparoMc"] = {
		_config = {
			title = "Reparador da Mecanica",
			gtype = "job"
		},
		"reparoMc.permissao",
		"reparo.permissao",
		"mecanico.permissao",
		"player.blips"
	},
	["PaisanaReparoMc"] = {
		_config = {
			title = "Repadador da Mecanica Folga",
			gtype = "job"
		},
		"paisanareparoMc.permissao",
		"sem.permissao",
		"player.blips"
	},

------------------------------------------ Vps -------------------------------------------------------------------------

	["Iniciante"] = {
		_config = {
			title = "VIP Iniciante",
			gtype = "vip"
		},
		"vipiniciante.permissao",
		"salario1.servico"
	},
	["Bronze"] = {
		_config = {
			title = "Bronze",
			gtype = "vip"
		},
		"bronze.permissao",
		"salario2.servico"
	},
	["Prata"] = {
		_config = {
			title = "Prata",
			gtype = "vip"
		},
		"prata.permissao",
		"salario3.servico"
	},
	["Ouro"] = {
		_config = {
			title = "Ouro",
			gtype = "vip"
		},
		"ouro.permissao",
		"salario4.servico"
	},
	["Platina"] = {
		_config = {
			title = "Platina",
			gtype = "vip"
		},
		"platina.permissao",
		"salario5.servico"
	},
	["Diamante"] = {
		_config = {
			title = "Diamante",
			gtype = "vip"
		},
		"diamante.permissao",
		"helivip.permissao",
		"salario6.servico"
	},
	["Topazio"] = {
		_config = {
			title = "Topázio",
			gtype = "vip"
		},
		"topazio.permissao",
		"helivip.permissao",
		"salario7.servico"
	},
	["Esmeralda"] = {
		_config = {
			title = "Esmeralda",
			gtype = "vip"
		},
		"esmeralda.permissao",
		"helivip.permissao",
		"salario8.servico"
	},
	["Rubi"] = {
		_config = {
			title = "Rubi",
			gtype = "vip"
		},
		"rubi.permissao",
		"helivip.permissao",
		"jatovip.permissao",
		"salario9.servico"
	},


}
------------------------------------------ Donos -------------------------------------------------------------------------
cfg.users = {
	[1] = { "Dono" },
	[2] = { "Dono" },
	[3] = { "Dono" },
	[8] = { "Dono" },

	
}

cfg.selectors = {

}

return cfg
------------------------------------------ PRF Policia Rodoviaria Federal
	----------------------------------------------------------------------------
	 --[["PRFTerceiraClasse"] = {
		_config = {
			title = "PRF Terceira Classe",
			gtype = "job"
		},
		"policia.permissao",
		"prfterceiraclasse.permissao",
 	    "player.noclip",
		"polpar.permissao",
		"sem.permissao"
	},
	["PaisanaPRFTerceiraClasse"] = {
		_config = {
			title = "PRF Terceira Classe Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanaprfterceiraclasse.permissao",
		"sem.permissao"
	},
	["PRFSegundaClasse"] = {
		_config = {
			title = "PRF Segunda Classe",
			gtype = "job"
		},
		"policia.permissao",
		"prfsegundaclasse.permissao",
		"polpar.permissao",
 	    "player.noclip",
		"sem.permissao"
	},
	["PaisanaPRFSegundaClasse"] = {
		_config = {
			title = "PRF Segunda Classe Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanaprfsegundaclasse.permissao",
		"sem.permissao"
	},
	["PRFPrimeiraClasse"] = {
		_config = {
			title = "PRF Primeira Classe",
			gtype = "job"
		},
		"policia.permissao",
		"prfprimeiraclasse.permissao",
		"polpar.permissao",
 	    "player.noclip",
		"sem.permissao"
	},
	["PaisanaPRFPrimeiraClasse"] = {
		_config = {
			title = "PRF Primeira Classe Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanaprfprimeiraclasse.permissao",
		"sem.permissao"
	},
	["PRFEspecial"] = {
		_config = {
			title = "PRF Especial",
			gtype = "job"
		},
		"policia.permissao",
		"prfespecial.permissao",
		"polpar.permissao",
 	    "player.noclip",
		"sem.permissao"
	},
	["PaisanaPRFEspecial"] = {
		_config = {
			title = "PRF Especial Folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"paisanaprfespecial.permissao",
		"sem.permissao"
	},]--
--------------------------------------- Bennys

				 ["LiderBennys"] = {
					_config = {
						title = "Lider Bennys",
						gtype = "job"
					},
					"liderBennys.permissao",
					"Bennys.permissao",
					"gBennys.permissao",
					"player.blips"
				},
				["ViceLiderBennys"] = {
					_config = {
						title = "Vice Lider Bennys",
						gtype = "job"
					},
					"viceliderBennys.permissao",
					"Bennys.permissao",
					"gBennys.permissao",
					"player.blips"
				},
				["GerenteBennys"] = {
					_config = {
						title = "Gerente Bennys",
						gtype = "job"
					},
					"gerenteBennys.permissao",
					"Bennys.permissao",
					"gBennys.permissao",
					"player.blips"
				},
				["Bennys"] = {
					_config = {
						title = "Membro Bennys",
						gtype = "job"
					},
					"Bennys.permissao",
					"player.blips"
				},
    





	----------------------------------------------
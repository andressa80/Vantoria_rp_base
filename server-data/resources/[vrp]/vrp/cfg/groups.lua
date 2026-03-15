local cfg = {}

cfg.groups = {
	["Dono"] = {
		"dono.permissao",
		"admin.permissao",
		"mod.permissao",
		"suporte.permissao",
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
	["Admin"] = {
		"admin.permissao",
		"mod.permissao",
		"suporte.permissao",
		"wl.permissao",
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
		"suporte.permissao",
		"wl.permissao",
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
		"wl.permissao",
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
	-----------------------------------------------------
	["Juiza"] = {
		_config = {
			title = "Juiza",
			gtype = "alt"
		},
		"juiza.permissao",
		"portadp.permissao",
		"sem.permissao"
	},
	["News"] = {
		_config = {
			title = "News",
			gtype = "job"
		},
		"news.permissao",
		"sem.permissao"	
	},
	["Vendedor"] = {
		_config = {
			title = "Vendedor",
			gtype = "altl"
		},
		"vendedor.permissao",
		"sem.permissao"	
	},
	["Advogado"] = {
		_config = {
			title = "Advogado",
			gtype = "alt"
		},
		"advogado.permissao",
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
	------------------------------------------ PRF Policia Rodoviaria Federal
	----------------------------------------------------------------------------
	["PRFTerceiraClasse"] = {
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
	},


	
	-----------------------------------------------------
	-- Hospital ------------------------------------
	-----------------------------------------------------

		["EnfermeiroHP"] = {
		_config = {
			title = "Enfermeiro HP",
			gtype = "job"
		},
		"enfermeirohp.permissao",
		"medico.permissao",
		"paramedico.permissao",
		"player.noclip",
		"player.blips"
	}, 
	["PaisanaEnfermeiroHP"] = {
		_config = {
			title = "Folga Enfermeiro HP",
			gtype = "job"
		},
		"paisanaenfermeirohp.permissao",
		"sem.permissao"	,	
		"player.blips"
	},
	["MedicoHP"] = {
		_config = {
			title = "Medico HP",
			gtype = "job"
		},
		"medicohp.permissao",
		"medico.permissao",
		"player.noclip",
		"paramedico.permissao",
		"player.blips"
	},
	["PaisanaMedicoHP"] = {
		_config = {
			title = "Folga Medico HP",
			gtype = "job"
		},
		"paisanamedicohp.permissao",
		"sem.permissao",
		"player.blips"
	}, 
	["MedicoChefeHP"] = {
		_config = {
			title = "Medico Chefe HP",
			gtype = "job"
		},
		"medicochefehp.permissao",
		"medico.permissao",
		"paramedico.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaMedicoChefeHP"] = {
		_config = {
			title = "Folga Medico Chefe HP",
			gtype = "job"
		},
		"paisanamedicochefehp.permissao",
		"sem.permissao",
		"player.blips"
	}, 
	["DiretorHP"] = {
		_config = {
			title = "Diretor HP",
			gtype = "job"
		},
		"diretorhp.permissao",
		"medico.permissao",
		"paramedico.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaDiretorHP"] = {
		_config = {
			title = "Folga Diretor HP",
			gtype = "job"
		},
		"paisanadiretorhp.permissao",
		"sem.permissao",
		"player.blips"
	}, 
	["ViceDiretorHP"] = {
		_config = {
			title = "Vice Diretor HP",
			gtype = "job"
		},
		"vicediretorhp.permissao",
		"medico.permissao",
		"player.noclip",
		"paramedico.permissao",
		"player.blips"
	}, 
	["PaisanaViceDiretorHP"] = {
		_config = {
			title = "Folga Vice Diretor HP",
			gtype = "job"
		},
		"paisanavicediretorhp.permissao",
		"sem.permissao",
		"player.blips"
	}, 

	------------------------------------------------------------------------------------------
	----------------- Mecânica Sense Customs --------------------------------------------------------

	["LiderLS"] = {
		_config = {
			title = "Lider LS",
			gtype = "job"
		},
		"liderls.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"mecanico.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaLiderLS"] = {
		_config = {
			title = "Folga Lider LS",
			gtype = "job"
		},
		"paisanaliderls.permissao",
		"sem.permissao",
		"player.blips"
	},
	["ViceLiderLS"] = {
		_config = {
			title = "ViceLider LS",
			gtype = "job"
		},
		"viceliderls.permissao",
		"mecanico.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaViceLiderLS"] = {
		_config = {
			title = "Folga ViceLider LS",
			gtype = "job"
		},
		"paisanaviceliderls.permissao",
		"sem.permissao",
		"player.blips"
	},
	["GerenteLS"] = {
		_config = {
			title = "Gerente LS",
			gtype = "job"
		},
		"gerentels.permissao",
		"mecanico.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaGerenteLS"] = {
		_config = {
			title = "Folga Gerente LS",
			gtype = "job"
		},
		"paisanagerentels.permissao",
		"sem.permissao",
		"player.blips"
	},
	["TunagemLS"] = {
		_config = {
			title = "Tunagem LS",
			gtype = "job"
		},
		"tunagemls.permissao",
		"reparo.permissao",
		"tunagem.permissao",
		"mecanico.permissao",
		"player.noclip",
		"player.blips"
	},
	["PaisanaTunagemLS"] = {
		_config = {
			title = "Folga Tunagem LS",
			gtype = "job"
		},
		"paisanatunagemls.permissao",
		"sem.permissao",
		"player.blips"
	},
	["ReparoLS"] = {
		_config = {
			title = "Reparo LS",
			gtype = "job"
		},
		"reparols.permissao",
		"reparo.permissao",
		"mecanico.permissao",
		"player.blips"
	},
	["PaisanaReparoLS"] = {
		_config = {
			title = "Folga Reparo LS",
			gtype = "job"
		},
		"paisanareparols.permissao",
		"sem.permissao",
		"player.blips"
	},

	------------------------------------------------ Bennys <

	["LiderBennys"] = {
		_config = {
			title = "Lider Bennys",
			gtype = "job"
		},
		"liderbennys.permissao",
		"bennys.permissao",
		"player.blips"
	},
	["ViceLiderBennys"] = {
		_config = {
			title = "ViceLider Bennys",
			gtype = "job"
		},
		"viceliderbennys.permissao",
		"bennys.permissao",
		"player.blips"
	},
	["GerenteBennys"] = {
		_config = {
			title = "Gerente Bennys",
			gtype = "job"
		},
		"gerentebennys.permissao",
		"bennys.permissao",
		"player.blips"
	},
	["Bennys"] = {
		_config = {
			title = "Membro Bennys",
			gtype = "job"
		},
		"bennys.permissao",
		"player.blips"
	},
	    ---------------------------------- mafia

    ["LiderMafia"] = {
		_config = {
			title = "Lider Mafia",
			gtype = "job"
		},
		"lidermafia.permissao",
		"mafia.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["ViceLiderMafia"] = {
		_config = {
			title = "Vice Lider Mafia",
			gtype = "job"
		},
		"vicelidermafia.permissao",
		"mafia.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["GerenteMafia"] = {
		_config = {
			title = "Gerente Mafia",
			gtype = "job"
		},
		"gerentemafia.permissao",
		"mafia.permissao",
		"gmafia.permissao",
		"player.blips"
	},
	["Mafia"] = {
		_config = {
			title = "Membro Mafia",
			gtype = "job"
		},
		"mafia.permissao",
		"player.blips"
	},
	
	--------------------------------------- Bratva

	["LiderFS"] = {
		_config = {
			title = "Lider Família Stanmeister's",
			gtype = "job"
		},
		"liderfs.permissao",
		"fs.permissao",
		"gfs.permissao",
		"player.blips"
	},
	["ViceLiderFS"] = {
		_config = {
			title = "Vice Lider Família Stanmeister's",
			gtype = "job"
		},
		"viceliderfs.permissao",
		"fs.permissao",
		"gfs.permissao",
		"player.blips"
	},
	["ConselheiroFS"] = {
		_config = {
			title = "Conselheiro Família Stanmeister's",
			gtype = "job"
		},
		"conselheirofs.permissao",
		"fs.permissao",
		"gfs.permissao",
		"player.blips"
	},
	["GoldenBoys"] = {
		_config = {
			title = "Gondel Boy's",
			gtype = "job"
		},
		"goldenboys.permissao",
		"player.blips"
	},
	 		--------------------------------------- Cartel

		 ["LiderCartel"] = {
			_config = {
				title = "Lider Cartel",
				gtype = "job"
			},
			"liderCartel.permissao",
			"Cartel.permissao",
			"gCartel.permissao",
			"player.blips"
		},
		["ViceLiderCartel"] = {
			_config = {
				title = "Vice Lider Cartel",
				gtype = "job"
			},
			"viceliderCartel.permissao",
			"Cartel.permissao",
			"gCartel.permissao",
			"player.blips"
		},
		["GerenteCartel"] = {
			_config = {
				title = "Gerente Cartel",
				gtype = "job"
			},
			"gerenteCartel.permissao",
			"Cartel.permissao",
			"gCartel.permissao",
			"player.blips"
		},
		["Cartel"] = {
			_config = {
				title = "Membro Cartel",
				gtype = "job"
			},
			"Cartel.permissao",
			"player.blips"
		},
    
	 		--------------------------------------- TDB

			 ["LiderTDB"] = {
				_config = {
					title = "Lider TDB",
					gtype = "job"
				},
				"liderTDB.permissao",
				"TDB.permissao",
				"gTDB.permissao",
				"player.blips"
			},
			["ViceLiderTDB"] = {
				_config = {
					title = "Vice Lider TDB",
					gtype = "job"
				},
				"viceliderTDB.permissao",
				"TDB.permissao",
				"gTDB.permissao",
				"player.blips"
			},
			["GerenteTDB"] = {
				_config = {
					title = "Gerente TDB",
					gtype = "job"
				},
				"gerenteTDB.permissao",
				"TDB.permissao",
				"gTDB.permissao",
				"player.blips"
			},
			["TDB"] = {
				_config = {
					title = "Membro TDB",
					gtype = "job"
				},
				"TDB.permissao",
				"player.blips"
			},
		 		--------------------------------------- TDT

				 ["LiderTDT"] = {
					_config = {
						title = "Lider TDT",
						gtype = "job"
					},
					"liderTDT.permissao",
					"TDT.permissao",
					"gTDT.permissao",
					"player.blips"
				},
				["ViceLiderTDT"] = {
					_config = {
						title = "Vice Lider TDT",
						gtype = "job"
					},
					"viceliderTDT.permissao",
					"TDT.permissao",
					"gTDT.permissao",
					"player.blips"
				},
				["GerenteTDT"] = {
					_config = {
						title = "Gerente TDT",
						gtype = "job"
					},
					"gerenteTDT.permissao",
					"TDT.permissao",
					"gTDT.permissao",
					"player.blips"
				},
				["TDT"] = {
					_config = {
						title = "Membro TDT",
						gtype = "job"
					},
					"TDT.permissao",
					"player.blips"
				},
			 		--------------------------------------- TDF

					 ["LiderTDF"] = {
						_config = {
							title = "Lider TDF",
							gtype = "job"
						},
						"liderTDF.permissao",
						"TDF.permissao",
						"gTDF.permissao",
						"player.blips"
					},
					["ViceLiderTDF"] = {
						_config = {
							title = "Vice Lider TDF",
							gtype = "job"
						},
						"viceliderTDF.permissao",
						"TDF.permissao",
						"gTDF.permissao",
						"player.blips"
					},
					["GerenteTDF"] = {
						_config = {
							title = "Gerente TDF",
							gtype = "job"
						},
						"gerenteTDF.permissao",
						"TDF.permissao",
						"gTDF.permissao",
						"player.blips"
					},
					["TDF"] = {
						_config = {
							title = "Membro TDF",
							gtype = "job"
						},
						"TDF.permissao",
						"player.blips"
					},
					
					    			 		--------------------------------------- TDJ

					 ["LiderTDJ"] = {
						_config = {
							title = "Lider TDJ",
							gtype = "job"
						},
						"liderTDJ.permissao",
						"TDJ.permissao",
						"gTDJ.permissao",
						"player.blips"
					},
					["ViceLiderTDJ"] = {
						_config = {
							title = "Vice Lider TDJ",
							gtype = "job"
						},
						"viceliderTDJ.permissao",
						"TDJ.permissao",
						"gTDJ.permissao",
						"player.blips"
					},
					["GerenteTDJ"] = {
						_config = {
							title = "Gerente TDJ",
							gtype = "job"
						},
						"gerenteTDJ.permissao",
						"TDJ.permissao",
						"gTDJ.permissao",
						"player.blips"
					},
					["TDJ"] = {
						_config = {
							title = "Membro TDJ",
							gtype = "job"
						},
						"TDJ.permissao",
						"player.blips"
					},

						--------------------------------------- Vanilla

		 ["LiderVanilla"] = {
			_config = {
				title = "Lider Vanilla",
				gtype = "job"
			},
			"liderVanilla.permissao",
			"Vanilla.permissao",
			"gVanilla.permissao",
			"player.blips"
		},
		["ViceLiderVanilla"] = {
			_config = {
				title = "Vice Lider Vanilla",
				gtype = "job"
			},
			"viceliderVanilla.permissao",
			"Vanilla.permissao",
			"gVanilla.permissao",
			"player.blips"
		},
		["GerenteVanilla"] = {
			_config = {
				title = "Gerente Vanilla",
				gtype = "job"
			},
			"gerenteVanilla.permissao",
			"Vanilla.permissao",
			"gVanilla.permissao",
			"player.blips"
		},
		["Vanilla"] = {
			_config = {
				title = "Membro Vanilla",
				gtype = "job"
			},
			"Vanilla.permissao",
			"player.blips"
		},
	 
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

cfg.users = {
	[1] = { "Dono" },
	[20] = { "Dono" },
	[24] = { "Dono" },
	[31] = { "Dono" },
	[32] = { "Dono" },
	[33] = { "Dono" },
	[42] = { "Dono" },
	[40] = { "Dono" },
	[39] = { "Dono" }
	
}

cfg.selectors = {

}

return cfg
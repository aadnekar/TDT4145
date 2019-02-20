CREATE TABLE regissør (
	regissørID	INTEGER NOT NULL,
    navn VARCHAR(50),
    CONSTRAINT regissør_PK PRIMARY KEY (regissørID)
);

CREATE TABLE film (
	filmID INTEGER NOT NULL,
    tittel VARCHAR(50),
    produksjonsår INTEGER,
    regissørID INTEGER NOT NULL,
    
    CONSTRAINT film_PK PRIMARY KEY (filmID),
    CONSTRAINT film_FK FOREIGN KEY (regissørID) REFERENCES regissør(regissørID)
												ON UPDATE CASCADE
                                                ON DELETE NO ACTION,
	CONSTRAINT gyldigårstall CHECK (produksjonsår > 0)
);
    
CREATE TABLE sjanger (
	sjangerID INTEGER NOT NULL,
    navn VARCHAR(50),
    beskrivelse TEXT,
    
    CONSTRAINT sjanger_PK PRIMARY KEY (sjangerID)
);
    
CREATE TABLE sjangerforfilm (
	sjangerID INTEGER NOT NULL,
    filmID INTEGER NOT NULL,
    
    CONSTRAINT sjangerforfilm_PK PRIMARY KEY (filmID, sjangerID),
    CONSTRAINT sjangerforfilm_FK_2 FOREIGN KEY (sjangerID) REFERENCES sjanger(sjangerID)
															ON UPDATE CASCADE
                                                            ON DELETE CASCADE,
    CONSTRAINT sjangerforfilm_FK_1 FOREIGN KEY (FilmID) REFERENCES film(filmID)
														ON UPDATE CASCADE
                                                        ON DELETE CASCADE
);

CREATE TABLE skuespiller (
	skuespillerID INTEGER NOT NULL,
    skuespiller_navn VARCHAR(50),
    fødselsår INTEGER,
    
    CONSTRAINT skuespiller_PK PRIMARY KEY (skuespillerID),
    CONSTRAINT gyldigårstall CHECK (fødselsår > 0)
);

CREATE TABLE skuespillerifilm (
	filmID INTEGER NOT NULL,
    skuespillerID INTEGER NOT NULL,
    rolle VARCHAR(50),
    
    CONSTRAINT skuespillerifilm_PK PRIMARY KEY (filmID, skuespillerID),
    CONSTRAINT skuespillerifilm_FK_1 FOREIGN KEY (filmID) REFERENCES film(filmID)
															ON UPDATE CASCADE
                                                            ON DELETE CASCADE,
	CONSTRAINT skuespillerifilm_FK_2 FOREIGN KEY (skuespillerID) REFERENCES skuespiller(skuespillerID)
																	ON UPDATE CASCADE
																	ON DELETE CASCADE
    
);





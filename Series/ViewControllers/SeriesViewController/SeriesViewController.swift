//
//  SeriesViewController.swift
//  Series
//
//  Created by ÁLVARO BARRADO FERNÁNDEZ on 1/10/18.
//  Copyright © 2018 ÁLVARO BARRADO FERNÁNDEZ. All rights reserved.
//

import UIKit

class SeriesViewController: UIViewController {
    @IBOutlet weak var siguienteBoton: UIButton!
    @IBOutlet weak var atrasBoton: UIButton!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var titulos: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var bg: UIImageView!
    internal var series: [Serie] = []
    internal var indexCurrentSerie = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Series"
        loadAllSeries()
        refresUIWithSerie(series[indexCurrentSerie])

        siguienteBoton.layer.cornerRadius=5.0
        siguienteBoton.layer.masksToBounds=true
        siguienteBoton.layer.borderWidth=2.0
        siguienteBoton.layer.borderColor=UIColor.white.cgColor
    
        atrasBoton.layer.cornerRadius=5.0
        atrasBoton.layer.masksToBounds=true
        atrasBoton.layer.borderWidth=2.0
        atrasBoton.layer.borderColor=UIColor.white.cgColor
    }
    
    private func refresUIWithSerie(_ serie: Serie){
        setupButtonsItems()
        titulos.text = serie.name
        image.image = UIImage(named: serie.imageFile)
        bg.image = UIImage(named: serie.imageFile)
        desc.text = serie.summary
    }
    
    private func setupButtonsItems(){
        let cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPressed))
        navigationItem.setLeftBarButton(cancelBarButton, animated: false)
        let mySerie = series[indexCurrentSerie]
        if mySerie.actors.count != 0 {
            let actorsBarButton = UIBarButtonItem(title: "Actors", style: .plain, target: self, action: #selector(actorsPressed))
            navigationItem.setRightBarButton(actorsBarButton, animated: false)
        }
    }
    
    @objc private func cancelPressed(){
   dismiss(animated: true, completion: nil)
    }
    
    @objc private func actorsPressed(){
        let mySerie = series[indexCurrentSerie]
        let actorsVC = ActorsViewController(actors: mySerie.actors)
        navigationController?.pushViewController(actorsVC, animated: true)

    }
    
    private func loadAllSeries(){
        let breakingBad = Serie(name: "Breking bad", imageFile: "breaking", summary: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", seasons: 6, actors: [])
        let betterCallSaul = Serie(name: "Better Call Saul", imageFile: "saul", summary: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", seasons: 3, actors: [])
        
        //https://vinicius73.github.io/gravatar-url-generator/#/robohash
        let daenerys = Actor(name: "Emilia Clarke", avatar: "https://robohash.org/801837a53bb592878f9767990fa14f77?set=set4&bgset=bg1&size=400x400")
        let peter = Actor(name: "Peter Dinklage", avatar: "https://robohash.org/c65ede2a59101e2a728f17427db5241c?set=set4&bgset=bg1&size=400x400")
        let actor = Actor(name: "Actor", avatar: "")
        
        let gameOfThrones = Serie(name: "Game of Thrones", imageFile: "thrones", summary: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", seasons: 8, actors: [daenerys, peter, actor])
        series.append(gameOfThrones)
        series.append(breakingBad)
        series.append(betterCallSaul)

    }
    
    @IBAction func next(){
        indexCurrentSerie = indexCurrentSerie + 1
        if indexCurrentSerie == series.count {
            print("reset")
            indexCurrentSerie = 0 }
        print("next")
        print(indexCurrentSerie)
            refresUIWithSerie(series[indexCurrentSerie])
        }
    
    @IBAction func back(){
        if indexCurrentSerie == 0 {
            print("reset")
            indexCurrentSerie = series.count }
        indexCurrentSerie = indexCurrentSerie - 1
        print("back")
        print(indexCurrentSerie)
        refresUIWithSerie(series[indexCurrentSerie])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

package com.example.pokeBook.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.pokeBook.models.Expense;
import com.example.pokeBook.repositories.PokeBookRepository;

@Service
public class PokeBookServices {
    private final PokeBookRepository pokebookRepository;

	public PokeBookServices(PokeBookRepository pokebookRepository) {
		this.pokebookRepository = pokebookRepository;
	}
	
	public List<Expense> allExpenses() {
        	return pokebookRepository.findAll();
    	}
	
	public Expense createBook(Expense b) {
		return pokebookRepository.save(b);
	    }
	
	public Expense findExpense(Long id) {
	        Optional<Expense> optionalpokeBook = pokebookRepository.findById(id);
	        return optionalpokeBook.isPresent()?  optionalpokeBook.get() : null;
	}
	
	public Expense updateExpense(Expense expense) {
		return pokebookRepository.save(expense);
	    }
	
	public void deleteExpense(Long id) {
		pokebookRepository.deleteById(id);
    }
    
}
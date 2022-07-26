package com.example.pokeBook.controllers;

import java.util.List;

import javax.persistence.Id;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.pokeBook.models.Expense;
import com.example.pokeBook.services.PokeBookServices;

@Controller
@RequestMapping("expenses")
public class PokebookController {
	private final PokeBookServices pokeBookServices;

	public PokebookController(PokeBookServices pokeBookServices) {
		this.pokeBookServices = pokeBookServices;
	}
	
	@RequestMapping("")
    public String index(Model model, @ModelAttribute("expense") Expense expense) {
        List<Expense> expenses = pokeBookServices.allExpenses();
        model.addAttribute("expenses", expenses);
        return "/index.jsp";
    }
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public String create(Model model, @Valid @ModelAttribute("expense") Expense expense, BindingResult result, RedirectAttributes redirectAttributes ) {
		if (result.hasErrors()) {
			List<Expense> expenses = pokeBookServices.allExpenses();
	        model.addAttribute("expenses", expenses);
            return "/index.jsp";
        } else {
        	pokeBookServices.createBook(expense);
    		redirectAttributes.addFlashAttribute("success", "Expense was created successfully");

            return "redirect:/expenses";
        }
	}
	
	@RequestMapping("/{id}")
	public String show(@PathVariable(value="id") Long id, Model model) {
		Expense expense = pokeBookServices.findExpense(id);
        model.addAttribute("expense", expense);
		return "/show_expense.jsp";
	}
	
	@RequestMapping("/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
		Expense expense = pokeBookServices.findExpense(id);
        model.addAttribute("expense", expense);
		
        return "/edit.jsp";
    }
    
    @RequestMapping(value="/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "/edit.jsp";
        } else {
        	pokeBookServices.updateExpense(expense);
        	redirectAttributes.addFlashAttribute("success", "Expense was edited successfully");
            return "redirect:/expenses";
        }
    }
	
    @RequestMapping(value="{id}/delete", method=RequestMethod.DELETE)
    public String destroy(@PathVariable(value="id") Long id,RedirectAttributes redirectAttributes) {
    	pokeBookServices.deleteExpense(id);
		redirectAttributes.addFlashAttribute("success", "Expense was deleted successfully");

    	return "redirect:/expenses";
    }
	
	
}

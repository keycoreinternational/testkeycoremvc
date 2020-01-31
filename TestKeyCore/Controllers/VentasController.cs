﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TestKeyCore.Models;

namespace TestKeyCore.Controllers
{
    public class VentasController : Controller
    {
        private ModelContainer db = new ModelContainer();

        // GET: Ventas
        public ActionResult Index()
        {
            var ventas = db.Ventas.Include(v => v.Vendedores).Include(v => v.Productos);
            return View(ventas.ToList());
        }

        // GET: Ventas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ventas ventas = db.Ventas.Find(id);
            if (ventas == null)
            {
                return HttpNotFound();
            }
            return View(ventas);
        }

        // GET: Ventas/Create
        public ActionResult Create()
        {
            ViewBag.VendedoresIdVendedor = new SelectList(db.Vendedores, "IdVendedor", "Tx_Nombre");
            ViewBag.ProductosIdProducto = new SelectList(db.Productos, "IdProducto", "Tx_Descripcion");
            return View();
        }

        // POST: Ventas/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdVenta,VendedoresIdVendedor,ProductosIdProducto,Dt_FechaVenta,Nu_Cantidad")] Ventas ventas)
        {
            if (ModelState.IsValid)
            {
                db.Ventas.Add(ventas);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.VendedoresIdVendedor = new SelectList(db.Vendedores, "IdVendedor", "Tx_Nombre", ventas.VendedoresIdVendedor);
            ViewBag.ProductosIdProducto = new SelectList(db.Productos, "IdProducto", "Tx_Descripcion", ventas.ProductosIdProducto);
            return View(ventas);
        }

        // GET: Ventas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ventas ventas = db.Ventas.Find(id);
            if (ventas == null)
            {
                return HttpNotFound();
            }
            ViewBag.VendedoresIdVendedor = new SelectList(db.Vendedores, "IdVendedor", "Tx_Nombre", ventas.VendedoresIdVendedor);
            ViewBag.ProductosIdProducto = new SelectList(db.Productos, "IdProducto", "Tx_Descripcion", ventas.ProductosIdProducto);
            return View(ventas);
        }

        // POST: Ventas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdVenta,VendedoresIdVendedor,ProductosIdProducto,Dt_FechaVenta,Nu_Cantidad")] Ventas ventas)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ventas).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.VendedoresIdVendedor = new SelectList(db.Vendedores, "IdVendedor", "Tx_Nombre", ventas.VendedoresIdVendedor);
            ViewBag.ProductosIdProducto = new SelectList(db.Productos, "IdProducto", "Tx_Descripcion", ventas.ProductosIdProducto);
            return View(ventas);
        }

        // GET: Ventas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ventas ventas = db.Ventas.Find(id);
            if (ventas == null)
            {
                return HttpNotFound();
            }
            return View(ventas);
        }

        // POST: Ventas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Ventas ventas = db.Ventas.Find(id);
            db.Ventas.Remove(ventas);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

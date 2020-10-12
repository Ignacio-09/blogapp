import { Component, OnInit } from '@angular/core';
import { DatosService } from '../datos.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-usuarios',
  templateUrl: './usuarios.component.html',
  styleUrls: ['./usuarios.component.css']
})

export class UsuariosComponent implements OnInit {

  level:string;
  user:string;
  nuevoUser = {user:"", pass:"", tipo:"", nombre:""};
  usuarios:any = [{user:"", pass:"", tipo:"", nombre:""}];
  tmpUser = {user:"", pass:"", tipo:"", nombre:""};


  constructor(private datos:DatosService, private router:Router, private msg:ToastrService) { }

  ngOnInit(): void {

    this.level = this.datos.getCuenta().level;
    this.llenarUsuarios();

  }


  llenarUsuarios(){
    this.datos.getUsuarios().subscribe(resp => {
      this.usuarios = resp;
      //console.log(resp);
    }, error => {
      console.log(error);
    })
  }

  agregarUsuario(){
    if(this.nuevoUser.user == '' ||this.nuevoUser.pass == '' ||
      this.nuevoUser.tipo == '' || this.nuevoUser.nombre == ''){
      this.msg.error("Completa todos los campos");
      return;
    }
    this.datos.postUsuario(this.nuevoUser).subscribe(resp => {
      if(resp['result']=='ok'){
        let usuario = JSON.parse(JSON.stringify(this.nuevoUser))
        this.usuarios.push(usuario);
        this.nuevoUser.user = '';
        this.nuevoUser.pass = '';
        this.nuevoUser.tipo = '';
        this.nuevoUser.nombre = '';
        this.msg.success("El usuario se guardo correctamente.");
      }else{
        this.msg.error("El usuario no se ha podido guardar.");
      }
    }, error => {
      console.log(error);
    });
  }

  temporalUsuario(usuario){
    this.tmpUser = JSON.parse(JSON.stringify(usuario));
  }

  guardarCambios(){
    this.datos.putUsuario(this.tmpUser).subscribe(resp => {
      if(resp['result']=='ok'){
        let i = this.usuarios.indexOf( this.usuarios.find( usuario => usuario.user == this.tmpUser.user ));
        this.usuarios[i].pass = this.tmpUser.pass;
        this.usuarios[i].tipo = this.tmpUser.tipo;
        this.usuarios[i].nombre = this.tmpUser.nombre;
        this.msg.success("El usuario se guardo correctamente.");
      }else{
        this.msg.error("El usuario no se ha podido guardar.");
      }
    }, error => {
      console.log(error);
    });
  }
 
  confirmarEliminar(){
    this.datos.deleteUsuario(this.tmpUser).subscribe(resp => {
      if(resp['result']=='ok'){
        let i = this.usuarios.indexOf( this.usuarios.find( usuario => usuario.user == this.tmpUser.user ));
        this.usuarios.splice(i,1);
        this.msg.success("El usuario se elimino correctamente.");
      }else{
        this.msg.error("El usuario no se ha podido guardar.");
      }
    }, error => {
      console.log(error);
    });
  }
}
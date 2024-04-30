function NiceInput(props){
    
    return(
        <>
            <div className="form__group field">
                <input type="input" className="form__field" placeholder="Name" name="name" id='name' onChange={(e) => props.fun(e, props.someUse)} required />
                <label for="e-mail" className="form__label">{props.inp}</label>
            </div>

        </>
    )
}
export default NiceInput

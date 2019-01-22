using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class WanderEnemy : EnemyBase
{
    public NavMeshAgent nav;

    public LayerMask navLayerMask;

    private float firerate = 0.5f;
    private float firenexttime = 0;

    public Transform Spawnpoint;

    public AudioClip Fire;

    AudioSource Audio1;
    // Use this for initialization
    void Start()
    {
        nav = GetComponent<NavMeshAgent>();
        Audio1 = GetComponent<AudioSource>();
    }

    // Update is called once per frame

    public override void move()
    {

        if (nav.remainingDistance <= nav.stoppingDistance && !nav.pathPending)
        {

            nav.SetDestination(NewRandomDestination());
            if (!CheckDestination())
            {
                nav.SetDestination(NewRandomDestination());
            }
        }
    }


    public Vector3 NewRandomDestination()
    {
        Vector3 origin = transform.position;
        Vector3 randDirection = Random.insideUnitSphere * 20;

        randDirection += origin;

        NavMeshHit navHit;

        NavMesh.SamplePosition(randDirection, out navHit, 20, navLayerMask);

        return navHit.position;

    }

    public bool CheckDestination()
    {
        NavMeshPath myPath = nav.path;
        nav.CalculatePath(nav.destination, myPath);
        if (myPath.status == NavMeshPathStatus.PathComplete)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public override void attack()
    {
        transform.LookAt(Player.position);

        if (Time.time > firenexttime)
        {
            firenexttime = Time.time + firerate;

            GameObject shoot = Instantiate(Resources.Load("EnemyBullet"), Spawnpoint.position, Spawnpoint.rotation) as GameObject;
            Rigidbody temp = shoot.GetComponent<Rigidbody>();
            temp.AddForce(shoot.transform.forward * 1000);

            Audio1.PlayOneShot(Fire, 0.5f);
        }

    }
}







